#!/usr/bin/make -f

SEARCH_API_SOLR_VERSION=3.x

# Example build command for local development.
# See Github Action for multi-arch and multi-stream building.
nbake:
	SEARCH_API_SOLR_VERSION=${SEARCH_API_SOLR_VERSION} docker buildx bake

.PHONY: *
