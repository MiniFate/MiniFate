IMAGE := jekyll-image
MOUNT := /workspace
DOCKER_BUILD := DOCKER_BUILDKIT=1 docker build

# Define Ruby version by reading .ruby-version file
RUBY_VERSION := $(shell cat .ruby-version)

# Define Bundler version
BUNDLER_VERSION := 2.4.22

.PHONY: all serve debug image refresh

all: serve

serve: image
	docker run --rm -p 4000:4000 -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) bundle exec jekyll serve --watch --livereload

# Interactive session within the image so you can poke around.
debug: image
	docker run -it --rm -p 4000:4000 -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE)

image: Dockerfile Gemfile .ruby-version
	$(DOCKER_BUILD) \
		--build-arg RUBY_VERSION=$(RUBY_VERSION) \
		--build-arg BUNDLER_VERSION=$(BUNDLER_VERSION) \
		. -f Dockerfile -t $(IMAGE)

# Rebuilding from a cached image can cause problems.
refresh: Dockerfile Gemfile .ruby-version
	$(DOCKER_BUILD) \
		--build-arg RUBY_VERSION=$(RUBY_VERSION) \
		--build-arg BUNDLER_VERSION=$(BUNDLER_VERSION) \
		--no-cache . -f Dockerfile -t $(IMAGE)
