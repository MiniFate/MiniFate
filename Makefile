IMAGE := jekyll-image
MOUNT := /workspace
DOCKER_BUILD := DOCKER_BUILDKIT=1 docker build

# Define Ruby version by reading .ruby-version file
RUBY_VERSION := $(shell cat .ruby-version)

# Define Bundler version
BUNDLER_VERSION := 2.4.22

.PHONY: all lock image refresh clean build serve debug

all: serve

# Update Gemfile.lock using Docker with the correct Ruby and Bundler versions
lock: .ruby-version
	@echo "Updating Gemfile.lock using Docker (ruby:$(RUBY_VERSION) with Bundler $(BUNDLER_VERSION))..."
	@docker run --rm \
		-v $(PWD):$(MOUNT) \
		-w $(MOUNT) \
		ruby:$(RUBY_VERSION) \
		/bin/bash -c "gem install bundler -v $(BUNDLER_VERSION) --no-document && \
		              bundle lock --update"
	@echo "Gemfile.lock updated successfully."

image: Dockerfile Gemfile Gemfile.lock .ruby-version
	$(DOCKER_BUILD) \
		--build-arg RUBY_VERSION=$(RUBY_VERSION) \
		--build-arg BUNDLER_VERSION=$(BUNDLER_VERSION) \
		. -f Dockerfile -t $(IMAGE)

# Rebuilding from a cached image can cause problems.
refresh: Dockerfile Gemfile Gemfile.lock .ruby-version
	$(DOCKER_BUILD) \
		--build-arg RUBY_VERSION=$(RUBY_VERSION) \
		--build-arg BUNDLER_VERSION=$(BUNDLER_VERSION) \
		--no-cache . -f Dockerfile -t $(IMAGE)

# Clean Jekyll build artifacts
clean: image
	@echo "Cleaning Jekyll build artifacts..."
	@docker run --rm -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) bundle exec jekyll clean

# Build the site for production
build: image clean
	@echo "Building site for production..."
	@docker run --rm -v $(PWD):$(MOUNT) -w $(MOUNT) -e JEKYLL_ENV=production $(IMAGE) bundle exec jekyll build

# Serve the site for local development with live reloading
serve: image clean
	@echo "Serving site at http://localhost:4000..."
	@docker run --rm -p 4000:4000 -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE) bundle exec jekyll serve --watch --livereload

# Interactive session within the image so you can poke around
debug: image
	@echo "Starting interactive debug session in container..."
	@docker run -it --rm -p 4000:4000 -v $(PWD):$(MOUNT) -w $(MOUNT) $(IMAGE)
