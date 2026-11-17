"""Responsive layout: no horizontal overflow, and ordered heading sizes."""

from __future__ import annotations

from itertools import pairwise

import pytest
from conftest import PAGES

# Report the outermost elements that extend past the viewport's right edge.
OVERFLOW_JS = """() => {
  const width = document.documentElement.clientWidth;
  const wide = [...document.querySelectorAll("main *")].filter(
    (e) => e.getBoundingClientRect().right > width + 0.5 && e.checkVisibility());
  return {
    scrollWidth: document.documentElement.scrollWidth,
    width,
    offenders: wide.filter((e) => !wide.includes(e.parentElement)).slice(0, 5)
      .map((e) => `<${e.tagName.toLowerCase()} class="${e.getAttribute("class") ?? ""}">`
        + ` ${(e.textContent ?? "").trim().slice(0, 40)}`),
  };
}"""

# Measure real headings, including the title block; insert missing levels.
HEADING_SIZES_JS = """() => [1, 2, 3, 4, 5, 6].map((level) => {
  const main = document.querySelector("main");
  const existing = main.querySelector(`h${level}`);
  const heading = existing ?? document.createElement(`h${level}`);
  if (!existing) {
    heading.textContent = "x";
    main.append(heading);
  }
  const size = parseFloat(getComputedStyle(heading).fontSize);
  if (!existing) heading.remove();
  return size;
})"""


@pytest.mark.parametrize("root_font", [None, "32px"], ids=["default-text", "200%-text"])
@pytest.mark.parametrize("path", PAGES)
def test_no_horizontal_overflow_at_320px(open_page, path, root_font):
    """WCAG 1.4.10: content reflows at 320 CSS px, also with text at 200%."""
    page = open_page(path, width=320, root_font=root_font)
    result = page.evaluate(OVERFLOW_JS)
    assert result["scrollWidth"] <= result["width"], (
        f"{path} is {result['scrollWidth']}px wide in a {result['width']}px viewport; "
        f"overflowing: {result['offenders']}"
    )


@pytest.mark.parametrize("width", [320, 900])
@pytest.mark.parametrize("media", ["screen", "print"])
@pytest.mark.parametrize("path", PAGES)
def test_heading_sizes_decrease_by_level(open_page, width, media, path):
    page = open_page(path, width=width)
    page.emulate_media(media=media)
    sizes = page.evaluate(HEADING_SIZES_JS)
    assert all(higher > lower for higher, lower in pairwise(sizes)), (
        f"{path} h1-h6 sizes in {media} at {width}px: {sizes}"
    )


@pytest.mark.parametrize("media", ["screen", "print"])
@pytest.mark.parametrize("path", PAGES)
def test_only_rules_headings_have_numerals(open_page, media, path):
    page = open_page(path)
    page.emulate_media(media=media)
    prefixes = page.locator("h3").evaluate_all(
        "headings => headings.map((h) => getComputedStyle(h, '::before').content)"
    )
    assert prefixes, f"{path} has no h3 headings"
    if path == "/index.html":
        assert all("counter(" in prefix for prefix in prefixes), prefixes
    else:
        assert all(prefix in ("none", "normal") for prefix in prefixes), prefixes


@pytest.mark.parametrize("path", PAGES)
def test_ids_are_unique(open_page, path):
    """Duplicate ids break labels, anchor links, and getElementById."""
    duplicates = open_page(path).evaluate("""() => {
      const ids = [...document.querySelectorAll("[id]")].map((e) => e.id);
      return [...new Set(ids.filter((id, i) => ids.indexOf(id) !== i))];
    }""")
    assert duplicates == [], f"{path} repeats ids: {duplicates}"
