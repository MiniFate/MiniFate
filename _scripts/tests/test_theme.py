"""Dark mode switches the page colors and inverts the black SVG art."""

from __future__ import annotations

import pytest

COLORS_JS = """() => {
  const body = getComputedStyle(document.body);
  const link = document.querySelector("main p a");
  const die = document.querySelector("img.die");
  return {
    background: body.backgroundColor,
    text: body.color,
    link: getComputedStyle(link).color,
    dieFilter: getComputedStyle(die).filter,
  };
}"""


def test_dark_mode_changes_colors(open_page):
    light = open_page("/index.html", color_scheme="light").evaluate(COLORS_JS)
    dark = open_page("/index.html", color_scheme="dark").evaluate(COLORS_JS)
    for key in ("background", "text", "link"):
        assert light[key] != dark[key], f"{key} is {light[key]} in both schemes"
    assert light["dieFilter"] == "none"
    assert dark["dieFilter"] == "invert(1)"


def luminance(rgb):
    """Relative luminance of an opaque sRGB color, with channels from 0 to 255."""
    channels = [channel / 255 for channel in rgb]
    linear = [
        channel / 12.92 if channel <= 0.04045 else ((channel + 0.055) / 1.055) ** 2.4
        for channel in channels
    ]
    return sum(
        channel * weight for channel, weight in zip(linear, (0.2126, 0.7152, 0.0722), strict=True)
    )


@pytest.mark.parametrize("color_scheme", ["light", "dark"])
def test_todo_text_has_readable_contrast(open_page, color_scheme):
    page = open_page("/index.html", color_scheme=color_scheme)
    # TODO blocks are authoring content and may be absent from the current rules.
    colors = page.evaluate("""() => {
      const todo = document.createElement("div");
      todo.className = "todo";
      todo.textContent = "Clarify this rule";
      document.querySelector("main").append(todo);
      const style = getComputedStyle(todo);
      const colors = [style.color, style.backgroundColor].map(
        (color) => color.match(/[\\d.]+/g).map(Number));
      todo.remove();
      return colors;
    }""")
    light, dark = sorted(map(luminance, colors), reverse=True)
    contrast = (light + 0.05) / (dark + 0.05)
    assert contrast >= 4.5, f"{color_scheme} TODO contrast is {contrast:.2f}:1: {colors}"
