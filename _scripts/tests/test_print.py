"""Printing: pagination and light colors for the rules and character sheet."""

from __future__ import annotations

from io import BytesIO

import pytest
from pypdf import PdfReader


def test_title_uses_print_size(open_page):
    page = open_page("/index.html")
    page.emulate_media(media="print")
    size = page.locator(".title-block h1").evaluate(
        "heading => parseFloat(getComputedStyle(heading).fontSize)"
    )
    assert size == pytest.approx(32), f"Title should print at 24pt (32px), got {size}px"


@pytest.mark.parametrize("paper", ["Letter", "A4"])
def test_rules_heading_prints_with_its_paragraph(open_page, paper):
    """The heading wrapper previously stranded this heading at a page's end."""
    page = open_page("/index.html")
    pdf = page.pdf(
        format=paper,
        margin=dict.fromkeys(("top", "right", "bottom", "left"), "0.5in"),
    )
    for printed_page in PdfReader(BytesIO(pdf)).pages:
        text = " ".join(printed_page.extract_text().split())
        if "Core Concept: Aspects" in text:
            assert "Aspects are short, improvised phrases" in text, (
                f"{paper}: heading prints separately from its paragraph"
            )
            return
    pytest.fail(f"{paper}: heading missing from printed rules")


@pytest.mark.parametrize("margin", ["0.4in", "0.5in", "0.75in", "1in"])
@pytest.mark.parametrize("paper", ["Letter", "A4"])
def test_character_sheet_prints_on_one_page(open_page, paper, margin):
    page = open_page("/character_sheet.html", color_scheme="dark")
    fields = {
        "Name": "Mara Flint",
        "Backstory": "Raised in the port city. Now searching for her missing crew.",
        "Concept": "Disgraced navigator",
        "Trouble": "Wanted by the fleet",
        "Consequence": "Broken wrist",
    }
    for label, value in fields.items():
        page.get_by_label(label, exact=True).fill(value)
    page.get_by_label("Stress box 1", exact=True).check()
    pdf = page.pdf(
        format=paper,
        margin={"top": margin, "right": margin, "bottom": margin, "left": margin},
    )
    pages = PdfReader(BytesIO(pdf)).pages
    assert len(pages) == 1, f"{paper} with {margin} margins prints {len(pages)} pages"
    text = " ".join(pages[0].extract_text().split())
    for value in (*fields, *fields.values(), "Stress", "Fate Points", "Refresh"):
        assert value.casefold() in text.casefold(), (
            f"{paper} with {margin} margins omits {value!r} from the printed sheet"
        )


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
