IMAGE := jekyll-image
MOUNT := /workspace
DOCKER_BUILD := DOCKER_BUILDKIT=1 docker build

.PHONY: all clean serve drafts debug image refresh

all: serve

# Clean out _site and other caches
clean: image
	docker run --rm -p 4000:4000 -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) bundle exec jekyll clean

# Serve the site as it will appear when published.
serve: image clean
	docker run --rm -p 4000:4000 -p 35729:35729 -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) bundle exec jekyll serve --watch --safe --livereload

# Serve the site but also publish drafts.
drafts: image clean
	docker run --rm -p 4000:4000 -p 35729:35729 -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) bundle exec jekyll serve --drafts --watch --safe --livereload

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

# Rebuilding from halfway using a cached image can sometimes cause
# problems. Use `make refresh` to rebuild the image from the ground up.
refresh: Dockerfile Gemfile
	rm -rf $(BUILDDIR)
	mkdir -p $(BUILDDIR)
	cp Gemfile $(BUILDDIR)
	$(DOCKER_BUILD) $(BUILDDIR) -f Dockerfile -t $(IMAGE) --no-cache
