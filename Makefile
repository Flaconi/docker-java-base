ifneq (,)
.error This Makefile requires GNU Make.
endif

.PHONY: help build rebuild tag test pull push login

CURRENT_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

FILE = Dockerfile
IMAGE = flaconi/java-base
TAG = latest

help:
	@echo "build       Build the image (TAG is required)"
	@echo "rebuild     Rebuild the image without cache (TAG is required)"
	@echo "test        Test the image (TAG is required)"
	@echo
	@echo "Available images to build:"
	@echo "   make build TAG=stretch-oracle-java8"
	@echo "   make build TAG=stretch-oracle-java9"
	@echo "   make build TAG=stretch-slim-oracle-java8"
	@echo "   make build TAG=stretch-slim-oracle-java9"
	@echo "   make build TAG=stretch-slim-openjdk-java8"
	@echo
	@echo "Available images to test:"
	@echo "   make test TAG=stretch-oracle-java8"
	@echo "   make test TAG=stretch-oracle-java9"
	@echo "   make test TAG=stretch-slim-oracle-java8"
	@echo "   make test TAG=stretch-slim-oracle-java9"
	@echo "   make test TAG=stretch-slim-openjdk-java8"

build:
	docker build -t $(IMAGE):$(TAG) -f $(TAG)/$(FILE) $(TAG)

rebuild: pull
	docker build --no-cache -t $(IMAGE):$(TAG) -f $(TAG)/$(FILE) $(TAG)

test:
	./tests/check.sh "$(IMAGE)" "$(TAG)" "$(VERSION)"

pull:
	@grep -E '^\s*FROM' Dockerfile \
		| sed -e 's/^FROM//g' -e 's/[[:space:]]*as[[:space:]]*.*$$//g' \
		| xargs -n1 docker pull;

login:
	yes | docker login --username $(USER) --password $(PASS)

tag:
	docker tag $(IMAGE):$(TAG) $(IMAGE):$(NEW_TAG)

push:
	docker push $(IMAGE):$(TAG)
