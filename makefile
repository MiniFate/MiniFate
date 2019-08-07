
IMAGE := pandoc-image
MOUNT := /workspace
INPUT := $(shell ls chapters/*.md | sort)
OUTPUT := out.pdf

.PHONY: all clean helper

all: pdf

pdf: container $(INPUT)
	docker run --rm -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) \
		pandoc $(INPUT) -o $(OUTPUT) --verbose --toc --toc-depth=1 --variable urlcolor=red

container: Dockerfile
	docker build . -f Dockerfile -t $(IMAGE)

refresh: Dockerfile
	docker build . -f Dockerfile -t $(IMAGE) --no-cache

clean:
	rm -f *.pdf
