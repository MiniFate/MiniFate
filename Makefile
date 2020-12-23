
IMAGE := pandoc-image
MOUNT := /workspace
INPUT := $(shell ls chapters/*.md | sort)
OUTPUT := MiniFate.pdf

.PHONY: all clean helper

all: $(OUTPUT)

$(OUTPUT): image $(INPUT)
	docker run --rm -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) pandoc $(INPUT) -o $(OUTPUT)

image: Dockerfile
	docker build . -f Dockerfile -t $(IMAGE)

refresh: Dockerfile
	docker build . -f Dockerfile -t $(IMAGE) --no-cache

clean:
	rm -f *.pdf
