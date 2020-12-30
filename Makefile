IMAGE := pandoc-image
MOUNT := /workspace
INPUT := $(shell ls chapters/*.md | sort)
NAME := MiniFate
PANDOC_FLAGS := --pdf-engine=wkhtmltopdf -c style.css

.PHONY: all clean pdf debug

all: pdf

# By default, Pandoc creates PDFs using LaTeX. Let's do HTML instead so we can
# tweak styles via CSS rather than by writing LaTeX macros.
pdf: image $(INPUT)
	docker run --rm -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) pandoc $(PANDOC_FLAGS) $(INPUT) -o $(NAME).pdf

debug: image $(INPUT)
	docker run --rm -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) pandoc $(INPUT) -o $(NAME).html

image: Dockerfile
	docker build . -f Dockerfile -t $(IMAGE)

refresh: Dockerfile
	docker build . -f Dockerfile -t $(IMAGE) --no-cache

clean:
	rm -f *.pdf
