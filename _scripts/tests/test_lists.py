"""Bullets are real list markers, so lists keep their semantics."""

from __future__ import annotations

# Marker style and ::before content of every bulleted item in <main>.
BULLETS_JS = """() => [...document.querySelectorAll("main ul > li")].map((li) => ({
  text: (li.textContent ?? "").trim().slice(0, 40),
  marker: getComputedStyle(li).listStyleType,
  before: getComputedStyle(li, "::before").content,
}))"""


def test_bullets_are_list_markers(open_page):
    """Safari drops list semantics for `list-style: none`, and screen readers
    read a ::before bullet as item text."""
    bullets = open_page("/index.html").evaluate(BULLETS_JS)
    assert bullets, "no bulleted items on /index.html"
    for bullet in bullets:
        assert bullet["marker"] != "none", f"no list marker: {bullet}"
        assert bullet["before"] in ("none", "normal"), f"::before bullet: {bullet}"
