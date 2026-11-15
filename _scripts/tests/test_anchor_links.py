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
def test_every_anchor_link_is_named_after_its_heading(open_page, path):
    page = open_page(path)
    links = page.locator("div.heading > a.anchor-link")
    assert links.count() > 0, f"{path} has no anchor links"
    for link in links.all():
        heading = link.locator("xpath=preceding-sibling::*[1]").inner_text().strip()
        label = link.get_attribute("aria-label") or ""
        assert heading and heading.casefold() in label.casefold(), (
            f"{path}: anchor link labeled {label!r} next to heading {heading!r}"
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
