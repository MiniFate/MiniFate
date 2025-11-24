# Makefile for MiniFate Jekyll site
#
# This Makefile provides targets for building and serving the MiniFate Jekyll
# site using Docker. All operations run inside a Docker container to ensure
# consistent behavior across different development environments.
#
# Common targets:
#   make          - Build image, clean, and serve the site locally (default)
#   make serve    - Same as above
#   make build    - Build the site for production deployment
#   make clean    - Remove Jekyll build artifacts
#   make debug    - Start an interactive shell in the Docker container

IMAGE := jekyll-image
MOUNT := /workspace
DOCKER_BUILD := DOCKER_BUILDKIT=1 docker build

# Define Ruby version by reading .ruby-version file
RUBY_VERSION := $(shell cat .ruby-version)

# Define Bundler version directly in the Makefile
BUNDLER_VERSION := 2.4.22

.PHONY: all lock image refresh clean build serve debug

all: serve

# Manual target to update Gemfile.lock using the correct Ruby and Bundler versions.
# Uses 'bundle lock --update' to regenerate the lockfile based on Gemfile.
# Note: Updates may fail with Ruby 2 due to newer gems requiring Ruby >= 3.0.
lock: .ruby-version
	@echo "Updating Gemfile.lock using Docker (ruby:$(RUBY_VERSION) with Bundler $(BUNDLER_VERSION))..."
	@docker run --rm \
		-v $(PWD):$(MOUNT) \
		-w $(MOUNT) \
		ruby:$(RUBY_VERSION) \
		/bin/bash -c "gem install bundler -v $(BUNDLER_VERSION) --no-document && \
		              bundle lock --update"
	@echo "Gemfile.lock updated successfully."

# Build the Docker image using '.' as build context.
# Pass the Ruby and Bundler versions as build arguments.
# Rebuilds automatically if Dockerfile, Gemfile, Gemfile.lock, or .ruby-version changes.
image: Dockerfile Gemfile Gemfile.lock .ruby-version
	$(DOCKER_BUILD) \
		--build-arg RUBY_VERSION=$(RUBY_VERSION) \
		--build-arg BUNDLER_VERSION=$(BUNDLER_VERSION) \
		. -f Dockerfile -t $(IMAGE)

# Rebuild the Docker image without cache.
# Use this if you're experiencing issues with cached layers or want a clean rebuild.
refresh: Dockerfile Gemfile Gemfile.lock .ruby-version
	$(DOCKER_BUILD) \
		--build-arg RUBY_VERSION=$(RUBY_VERSION) \
		--build-arg BUNDLER_VERSION=$(BUNDLER_VERSION) \
		--no-cache . -f Dockerfile -t $(IMAGE)

# Clean Jekyll build artifacts (_site directory and caches).
# Requires the image to exist.
clean: image
	@echo "Cleaning Jekyll build artifacts..."
	@docker run --rm -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) bundle exec jekyll clean

# Build the site for production.
# Sets JEKYLL_ENV=production to enable production-specific features.
# Depends on image and clean to ensure a fresh build.
build: image clean
	@echo "Building site for production..."
	@docker run --rm -v $(PWD):$(MOUNT) -w $(MOUNT) -e JEKYLL_ENV=production $(IMAGE) bundle exec jekyll build

# Serve the site for local development with live reloading.
# Exposes port 4000 for the site and port 35729 for livereload WebSocket.
# Uses --incremental for faster rebuilds (only regenerates changed files).
# Depends on image and clean to start with a fresh build.
serve: image clean
	@echo "Serving site at http://localhost:4000..."
	@docker run --rm \
		-p 4000:4000 \
		-p 35729:35729 \
		-v $(PWD):$(MOUNT) \
		-w $(MOUNT) \
		$(IMAGE) \
		bundle exec jekyll serve --watch --incremental --livereload

# Interactive session within the Docker container.
# Useful for debugging, running manual commands, or exploring the environment.
# Depends on image existing.
debug: image
	@echo "Starting interactive debug session in container..."
	@docker run -it --rm -p 4000:4000 -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE)
