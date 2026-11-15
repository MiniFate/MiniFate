"""Shared fixtures: headless Chromium serving the built site from disk.

Pages load from `SITE_ORIGIN`, which Playwright routes to files in `_site/`,
so no web server runs and no request leaves the machine. Set `MINIFATE_SITE`
to test a build in another directory.
"""

from __future__ import annotations

import mimetypes
import os
from collections.abc import Callable, Iterator
from pathlib import Path
from urllib.parse import unquote, urlsplit

import pytest
from playwright.sync_api import Browser, Page, Route, sync_playwright

SITE_ORIGIN = "https://site.test"
SITE_DIR = Path(
    os.environ.get("MINIFATE_SITE", Path(__file__).resolve().parents[2] / "_site")
)
PAGES = ("/index.html", "/character_sheet.html")


def serve_site(route: Route) -> None:
    """Answer a request for `SITE_ORIGIN` from `SITE_DIR`; 404 anything else."""
    url = urlsplit(route.request.url)
    path = SITE_DIR / unquote(url.path).lstrip("/")
    if path.is_dir():
        path = path / "index.html"
    if f"{url.scheme}://{url.netloc}" != SITE_ORIGIN or not path.is_file():
        route.fulfill(status=404, body="not found")
        return
    content_type = mimetypes.guess_type(path.name)[0] or "application/octet-stream"
    route.fulfill(status=200, body=path.read_bytes(), content_type=content_type)


@pytest.fixture(scope="session")
def browser() -> Iterator[Browser]:
    if not (SITE_DIR / "index.html").is_file():
        pytest.exit(f"No built site in {SITE_DIR}; run `make build` first.", returncode=2)
    with sync_playwright() as playwright:
        browser = playwright.chromium.launch()
        yield browser
        browser.close()


OpenPage = Callable[..., Page]


@pytest.fixture
def open_page(browser: Browser) -> Iterator[OpenPage]:
    """Return a function that opens a site page and returns it, fully loaded.

    Arguments: the page path, then keyword-only `width` (CSS px, default
    900), `root_font` (a CSS length for the root font size, to simulate a
    larger browser text setting), and `color_scheme` ("light" or "dark").
    """
    contexts = []

    def open_(
        path: str,
        *,
        width: int = 900,
        root_font: str | None = None,
        color_scheme: str = "light",
    ) -> Page:
        context = browser.new_context(
            viewport={"width": width, "height": 800}, color_scheme=color_scheme
        )
        contexts.append(context)
        context.route("**/*", serve_site)
        page = context.new_page()
        response = page.goto(SITE_ORIGIN + path, wait_until="load")
        assert response is not None and response.ok, f"{path} did not load"
        if root_font:
            page.add_style_tag(content=f":root {{ font-size: {root_font} !important; }}")
        page.evaluate("document.fonts.ready")
        return page

    yield open_
    for context in contexts:
        context.close()
