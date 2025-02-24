#!/usr/bin/make -f

ifeq ($(OS),Windows_NT)
    DOCKER ?= docker
else
    DOCKER ?= $(if $(shell docker -v 2>/dev/null),docker,podman)
endif
DOCKER_IMAGE_TAG = demoscenery
PORT ?= 10000
RESOLUTION ?= "3840x2160"  ## TODO: deterime this automatically

all: build
.PHONY: all

build:
	@$(DOCKER) build -t ${DOCKER_IMAGE_TAG} .
.PHONY: build

debug: build
	@$(DOCKER) run -p $(PORT):$(PORT) --rm -it -e PORT=${PORT} -e RESOLUTION=${RESOLUTION} ${DOCKER_IMAGE_TAG}
.PHONY: debug

run: build
	@$(DOCKER) build -t ${DOCKER_IMAGE_TAG}/$(demo) -f $(demo)/Dockerfile .
	@$(DOCKER) run -p $(PORT):$(PORT) --rm -it -e PORT=${PORT} -e RESOLUTION=${RESOLUTION} ${DOCKER_IMAGE_TAG}/$(demo)
.PHONY: run

clean:
	@$(DOCKER) rmi $($(DOCKER) images | grep "${DOCKER_IMAGE_TAG}" | awk '{print $"3"}') --force
.PHONY: clean
