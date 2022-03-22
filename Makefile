#!/usr/bin/make -f

REGISTRY=skpr/solr-drupal
VERSION_TAG=v2-latest
ARCH=amd64

FROM_IMAGE=7.7-slim
SOLR_VERSION=7.x
SEARCH_API_SOLR_VERSION=3.x

build:
	$(eval IMAGE=${REGISTRY}:${SOLR_VERSION}-${SEARCH_API_SOLR_VERSION}-${VERSION_TAG}-${ARCH})
	docker build --build-arg SOLR_IMAGE=${FROM_IMAGE} \
				 --build-arg SOLR_VERSION=${SOLR_VERSION} \
	             --build-arg SEARCH_API_SOLR_VERSION=${SEARCH_API_SOLR_VERSION} \
				 -t ${IMAGE} .

push:
	$(eval IMAGE=${REGISTRY}:${SOLR_VERSION}-${SEARCH_API_SOLR_VERSION}-${VERSION_TAG}-${ARCH})
	docker push ${IMAGE}

manifest:
	$(eval IMAGE=${REGISTRY}:${SOLR_VERSION}-${SEARCH_API_SOLR_VERSION}-${VERSION_TAG})
	docker manifest create ${IMAGE} --amend ${IMAGE}-arm64 --amend ${IMAGE}-amd64
	docker manifest push ${IMAGE}

.PHONY: *