# Makefile for Jekyll site
IMAGE := jekyll-image
MOUNT := /workspace
DOCKER_BUILD := DOCKER_BUILDKIT=1 docker build

# Define Ruby version by reading .ruby-version file, ignoring comments/whitespace
RUBY_VERSION := $(shell grep -v '^\#' .ruby-version)

# Define Bundler version directly in the Makefile
BUNDLER_VERSION := 2.4.22

# Define base image using the determined Ruby version
BASE_RUBY_IMAGE := ruby:$(RUBY_VERSION)

.PHONY: all lock image refresh clean build serve debug

all: serve

# Manual target to update Gemfile.lock using the correct base Docker image and Bundler version.
lock: .ruby-version
	@echo "Updating and normalizing Gemfile.lock using Docker ($(BASE_RUBY_IMAGE) with Bundler $(BUNDLER_VERSION))..."
	@docker run --rm \
		-v $(PWD):$(MOUNT) \
		-w $(MOUNT) \
		$(BASE_RUBY_IMAGE) \
		/bin/bash -c "echo 'Installing Bundler $(BUNDLER_VERSION)...' && \
		              gem install bundler -v $(BUNDLER_VERSION) --no-document && \
		              echo 'Running bundle lock --update --normalize-platforms...' && \
		              bundle lock --update --normalize-platforms"
	@echo "Gemfile.lock updated and normalized successfully."

# Build the Docker image using '.' as build context.
image: Dockerfile Gemfile Gemfile.lock .ruby-version
	@echo "Building Docker image $(IMAGE) using Ruby $(RUBY_VERSION) and Bundler $(BUNDLER_VERSION)..."
	@$(DOCKER_BUILD) \
		--build-arg RUBY_VERSION=$(RUBY_VERSION) \
		--build-arg BUNDLER_VERSION=$(BUNDLER_VERSION) \
		. -f Dockerfile -t $(IMAGE)

# Rebuild the Docker image without cache.
refresh: Dockerfile Gemfile Gemfile.lock .ruby-version
	@echo "Rebuilding Docker image $(IMAGE) with --no-cache..."
	@$(DOCKER_BUILD) \
		--build-arg RUBY_VERSION=$(RUBY_VERSION) \
		--build-arg BUNDLER_VERSION=$(BUNDLER_VERSION) \
		--no-cache . -f Dockerfile -t $(IMAGE)

# Clean Jekyll build artifacts (_site directory and caches).
clean: image
	@echo "Cleaning Jekyll build artifacts..."
	@docker run --rm -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) bundle exec jekyll clean

# Build the site for production.
build: image clean
	@echo "Building site for production..."
	@docker run --rm -v $(PWD):$(MOUNT) -w $(MOUNT) -e JEKYLL_ENV=production $(IMAGE) bundle exec jekyll build

# Serve the site for local development with live reloading.
serve: image clean
	@echo "Serving site at http://localhost:4000..."
	@docker run --rm \
		-p 4000:4000 \
		-p 35729:35729 \
		-v $(PWD):$(MOUNT) \
		-w $(MOUNT) \
		-e JEKYLL_ENV=docker \
		$(IMAGE) \
		bundle exec jekyll serve --config _config.yml,_config_docker.yml --watch --incremental --livereload

# Interactive session within the Docker container.
debug: image
	@echo "Starting interactive debug session in container..."
	@docker run -it --rm -p 4000:4000 -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) /bin/bash
