"""Heading anchor links: named, outside the heading, and keyboard-reachable."""

from __future__ import annotations

import pytest
from conftest import PAGES

MAX_TABS = 100


@pytest.mark.parametrize("path", PAGES)
def test_headings_contain_no_links(open_page, path):
    """A link inside a heading adds its label to the heading's accessible name."""
    page = open_page(path)
    nested = page.locator(":is(h2, h3, h4, h5, h6) a").count()
    assert nested == 0, f"{path}: {nested} links inside h2-h6"


@pytest.mark.parametrize("path", PAGES)
def test_every_heading_has_a_named_permalink(open_page, path):
    page = open_page(path)
    headings = page.locator(":is(h2, h3, h4, h5, h6)[id]:not(.no_anchor)")
    assert headings.count() > 0, f"{path} has no eligible headings"
    for heading in headings.all():
        text = (heading.text_content() or "").strip()
        link = page.get_by_role("link", name=f"Link to this section: {text}", exact=True)
        assert link.count() == 1, f"{path}: expected one permalink for {text!r}"
        assert link.get_attribute("href") == f"#{heading.get_attribute('id')}", (
            f"{path}: permalink for {text!r} targets the wrong heading"
        )
        bounds = link.bounding_box()
        assert bounds and bounds["width"] >= 24 and bounds["height"] >= 24, (
            f"{path}: permalink for {text!r} has a target smaller than 24px: {bounds}"
        )


def test_anchor_link_icon_shows_on_keyboard_focus(open_page):
    page = open_page("/index.html")
    for _ in range(MAX_TABS):
        page.keyboard.press("Tab")
        if page.evaluate("document.activeElement.matches('a.anchor-link')"):
            break
    else:
        pytest.fail(f"No anchor link reached in {MAX_TABS} presses of Tab")
    state = page.evaluate("""() => {
      const link = document.activeElement;
      return {
        focusVisible: link.matches(":focus-visible"),
        icon: getComputedStyle(link.querySelector("svg")).visibility,
        outline: getComputedStyle(link).outlineStyle,
      };
    }""")
    assert state == {"focusVisible": True, "icon": "visible", "outline": "solid"}
