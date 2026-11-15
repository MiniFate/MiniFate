"""Printing: the character sheet fits one page, always in light colors."""

from __future__ import annotations

import re

import pytest

# A page object's type entry; `(?!s)` skips the `/Pages` tree root.
PDF_PAGE = re.compile(rb"/Type\s*/Page(?!s)")


@pytest.mark.parametrize("margin", ["0.4in", "0.5in", "0.75in", "1in"])
@pytest.mark.parametrize("paper", ["Letter", "A4"])
def test_character_sheet_prints_on_one_page(open_page, paper, margin):
    page = open_page("/character_sheet.html", color_scheme="dark")
    pdf = page.pdf(
        format=paper,
        margin={"top": margin, "right": margin, "bottom": margin, "left": margin},
    )
    pages = len(PDF_PAGE.findall(pdf))
    assert pages == 1, f"{paper} with {margin} margins prints {pages} pages"


@pytest.mark.parametrize("path", ["/index.html", "/character_sheet.html"])
def test_print_uses_light_colors_in_dark_mode(open_page, path):
    page = open_page(path, color_scheme="dark")
    page.emulate_media(media="print", color_scheme="dark")
    colors = page.evaluate("""() => {
      const style = getComputedStyle(document.body);
      return [style.backgroundColor, style.color];
    }""")
    assert colors == ["rgb(255, 255, 255)", "rgb(0, 0, 0)"], f"{path} prints with {colors}"
    hidden = page.evaluate(
        "[...document.querySelectorAll('a.anchor-link')].every("
        "(link) => getComputedStyle(link).display === 'none')"
    )
    assert hidden, f"{path} prints heading anchor icons"
