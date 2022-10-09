IMAGE := jekyll-image
MOUNT := /workspace
DOCKER_BUILD := DOCKER_BUILDKIT=1 docker build

.PHONY: all serve debug image refresh

all: serve

serve: image
	docker run --rm -p 4000:4000 -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) bundle exec jekyll serve

# Interactive session within the image so you can poke around.
debug: image
	docker run -it --rm -p 4000:4000 -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE)

# Don't send the whole repo to Docker. All we need is the Gemfile.
BUILDDIR := /tmp/jekyll-docker

image: Dockerfile Gemfile
	rm -rf $(BUILDDIR)
	mkdir -p $(BUILDDIR)
	cp Gemfile $(BUILDDIR)
	$(DOCKER_BUILD) $(BUILDDIR) -f Dockerfile -t $(IMAGE)

# Rebuilding from a cached image can cause problems.
refresh: Dockerfile Gemfile
	rm -rf $(BUILDDIR)
	mkdir -p $(BUILDDIR)
	cp Gemfile $(BUILDDIR)
	$(DOCKER_BUILD) $(BUILDDIR) -f Dockerfile -t $(IMAGE) --no-cache
