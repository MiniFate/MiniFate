# Output Names
NAME := minifate

HTML_FILE := $(NAME).html
PDF_FILE := $(NAME).pdf
ODT_FILE := $(NAME).odt

# Output names with current date
NOW := $(shell date "+%Y-%m-%d")

DATED_NAME := $(NAME)_$(NOW)

DATED_HTML_FILE := $(DATED_NAME).html
DATED_PDF_FILE := $(DATED_NAME).pdf
DATED_ODT_FILE := $(DATED_NAME).odt

# File types
MARKDOWN_TYPE := markdown

# Pandoc base command
BASE_COMMAND := pandoc --from=$(MARKDOWN_TYPE)

# List of the chapters, which start with two numbers and end with .md for
# "markdown"
CHAPTERS := \
	chapters/introduction.md\
	chapters/game_creation.md\
	chapters/character_creation.md\
	chapters/skills.md\
	chapters/aspects_and_fate_points.md\
	chapters/actions.md\
	chapters/npc.md

# List for the clean targets
CLEAN_TARGETS := \
	clean-html clean-html-dated\
	clean-pdf clean-pdf-dated\
	clean-odt clean-odt-dated

# .PHONY is a special target that tells make to run certain targets (for
# example, "clean") if asked, even if a file with that same name already exists
# and hasn't been modified recently
.PHONY: clean $(CLEAN_TARGETS)

# Make all targets
all: html pdf odt

# Clean up all output files
clean: $(CLEAN_TARGETS)

# Make an HTML Page
html: $(CHAPTERS)
	$(BASE_COMMAND) $(CHAPTERS) --to=html5 -o $(HTML_FILE)

clean-html:
	rm -f $(HTML_FILE)

html-dated: $(CHAPTERS)
	$(BASE_COMMAND) $(CHAPTERS) --to=html5 -o $(DATED_HTML_FILE)

clean-html-dated:
	rm -f $(DATED_HTML_FILE)

# Make a PDF via LaTeX
pdf: $(CHAPTERS)
	$(BASE_COMMAND) $(CHAPTERS) --smart -o $(PDF_FILE)

clean-pdf:
	rm -f $(PDF_FILE)

pdf-dated: $(CHAPTERS)
	$(BASE_COMMAND) $(CHAPTERS) --smart -o $(DATED_PDF_FILE)

clean-pdf-dated:
	rm -f $(DATED_PDF_FILE)

# Make an OpenOffice Document
odt: $(CHAPTERS)
	$(BASE_COMMAND) $(CHAPTERS) --to=odt -o $(ODT_FILE)

clean-odt:
	rm -f $(ODT_FILE)

odt-dated: $(CHAPTERS)
	$(BASE_COMMAND) $(CHAPTERS) --to=odt -o $(DATED_ODT_FILE)

clean-odt-dated:
	rm -f $(DATED_ODT_FILE)
