variable "SEARCH_API_SOLR_VERSION" {
  default = "3.x"
}

variable "STREAM" {
  default = "latest"
}

variable "VERSION" {
  default = "v2"
}

variable "PLATFORMS" {
  default = ["linux/amd64", "linux/arm64"]
}

variable "REGISTRIES" {
  default = ["docker.io", "ghcr.io"]
}

# Common target: Everything inherits from this
target "_common" {
  platforms = PLATFORMS
}

group "default" {
  targets = [
    "solr",
  ]
}

target "solr" {
  inherits = ["_common"]

  args = {
    SEARCH_API_SOLR_VERSION = SEARCH_API_SOLR_VERSION
  }

  tags = [
    for r in REGISTRIES :
    "${r}/skpr/solr-drupal:7.x-${SEARCH_API_SOLR_VERSION}-${VERSION}-${STREAM}"
  ]
}
