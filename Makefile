# Makefile for Jekyll site
IMAGE := jekyll-image
MOUNT := /workspace

# Define Ruby version by reading .ruby-version file, ignoring comments/whitespace
RUBY_VERSION := $(shell grep -v '^\#' .ruby-version)

# Define Bundler version directly in the Makefile
BUNDLER_VERSION := 2.6.8

# Define base image using the determined Ruby version
BASE_RUBY_IMAGE := ruby:$(RUBY_VERSION)

# Get the current user's UID and GID to run Docker commands as the host user.
# This prevents Docker from creating files (e.g., _site) as root.
# We also set HOME=/tmp to give the user a writable home directory inside the
# container, which prevents certain permission errors with Jekyll and Bundler.
USER_ID := $(shell id -u)
GROUP_ID := $(shell id -g)
DOCKER_RUN_OPTS := --user $(USER_ID):$(GROUP_ID) -e HOME=/tmp

# Define reusable Docker run command to reduce boilerplate
DOCKER_RUN := docker run --rm $(DOCKER_RUN_OPTS) -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE)

# Tier 1: Daily drivers
.PHONY: serve build clean debug

# Tier 2: Domain operations
.PHONY: image-build image-rebuild deps-lock

# Internal targets
.PHONY: all

# Tier 3: Backward compatibility aliases
.PHONY: image refresh lock

all: serve

# Manual target to update Gemfile.lock using the correct base Docker image and Bundler version.
deps-lock: .ruby-version
	@echo "Updating and normalizing Gemfile.lock using Docker ($(BASE_RUBY_IMAGE) with Bundler $(BUNDLER_VERSION))..."
	@echo "Running 'bundle lock --update --normalize-platforms' inside container..."
	@docker run --rm \
		$(DOCKER_RUN_OPTS) \
		-v $(PWD):$(MOUNT) \
		-w $(MOUNT) \
		$(BASE_RUBY_IMAGE) \
		/bin/bash -c "echo 'Installing Bundler $(BUNDLER_VERSION)...' && \
		              gem install bundler -v $(BUNDLER_VERSION) --no-document && \
		              echo 'Running bundle lock --update --normalize-platforms...' && \
		              bundle lock --update --normalize-platforms"
	@echo "Gemfile.lock updated and normalized successfully. Please commit Gemfile, Gemfile.lock, and .ruby-version."

# Build the Docker image using '.' as build context.
image-build: Dockerfile Gemfile Gemfile.lock .ruby-version
	@echo "Building Docker image $(IMAGE) using Ruby $(RUBY_VERSION) and Bundler $(BUNDLER_VERSION)..."
	@docker build \
		--build-arg RUBY_VERSION=$(RUBY_VERSION) \
		--build-arg BUNDLER_VERSION=$(BUNDLER_VERSION) \
		. -f Dockerfile -t $(IMAGE)

# Rebuild the Docker image without cache.
image-rebuild: Dockerfile Gemfile Gemfile.lock .ruby-version
	@echo "Rebuilding Docker image $(IMAGE) with --no-cache using Ruby $(RUBY_VERSION) and Bundler $(BUNDLER_VERSION)..."
	@docker build \
		--build-arg RUBY_VERSION=$(RUBY_VERSION) \
		--build-arg BUNDLER_VERSION=$(BUNDLER_VERSION) \
		--no-cache . -f Dockerfile -t $(IMAGE)

# Clean Jekyll build artifacts (_site directory and caches).
clean: image-build
	@echo "Cleaning Jekyll build artifacts..."
	@$(DOCKER_RUN) bundle exec jekyll clean

# Build the site for production.
build: image-build clean
	@echo "Building site for production..."
	@docker run --rm $(DOCKER_RUN_OPTS) -v $(PWD):$(MOUNT) -w $(MOUNT) -e JEKYLL_ENV=production $(IMAGE) \
		bundle exec jekyll build

# Serve the site for local development with live reloading.
serve: image-build clean
	@echo "Serving site at http://localhost:4000..."
	@docker run --rm $(DOCKER_RUN_OPTS) -v $(PWD):$(MOUNT) -w $(MOUNT) -p 4000:4000 -p 35729:35729 -e JEKYLL_ENV=docker $(IMAGE) \
		bundle exec jekyll serve --config _config.yml,_config_docker.yml --watch --incremental --livereload

# Interactive session within the Docker container.
debug: image-build
	@echo "Starting interactive debug session in container..."
	@docker run -it $(DOCKER_RUN_OPTS) -p 4000:4000 -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) /bin/bash

# --- Backward Compatibility Aliases ---
# These aliases maintain backward compatibility for muscle memory.
image: image-build
refresh: image-rebuild
lock: deps-lock
