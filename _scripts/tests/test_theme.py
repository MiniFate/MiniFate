"""Dark mode switches the page colors and inverts the black SVG art."""

from __future__ import annotations

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
