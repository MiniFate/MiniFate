"""Responsive layout: no horizontal overflow, and ordered heading sizes."""

from __future__ import annotations

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

# Font size in px of a fresh h1-h6 placed inside <main>.
HEADING_SIZES_JS = """() => [1, 2, 3, 4, 5, 6].map((level) => {
  const heading = document.createElement(`h${level}`);
  heading.textContent = "x";
  document.querySelector("main").append(heading);
  const size = parseFloat(getComputedStyle(heading).fontSize);
  heading.remove();
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
def test_heading_sizes_decrease_by_level(open_page, width):
    sizes = open_page("/index.html", width=width).evaluate(HEADING_SIZES_JS)
    assert all(higher > lower for higher, lower in zip(sizes, sizes[1:])), (
        f"h1-h6 sizes at {width}px: {sizes}"
    )


@pytest.mark.parametrize("path", PAGES)
def test_ids_are_unique(open_page, path):
    """Duplicate ids break labels, anchor links, and getElementById."""
    duplicates = open_page(path).evaluate("""() => {
      const ids = [...document.querySelectorAll("[id]")].map((e) => e.id);
      return [...new Set(ids.filter((id, i) => ids.indexOf(id) !== i))];
    }""")
    assert duplicates == [], f"{path} repeats ids: {duplicates}"
