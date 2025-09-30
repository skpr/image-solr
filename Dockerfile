FROM solr:7.7-slim
LABEL maintainer="admin@skpr.io"

ENV SOLR_CORE="drupal"

ENV SOLR_HEAP="256m"
ENV SOLR_JAVA_MEM="-Xms256m -Xmx256m"
ENV JVM_OPTS="-Xms256m -Xmx256m"

# https://www.docker.com/blog/apache-log4j-2-cve-2021-44228
ENV LOG4J_FORMAT_MSG_NO_LOOKUPS=true

ARG SEARCH_API_SOLR_VERSION

COPY --chown=solr:solr search_api_solr/${SEARCH_API_SOLR_VERSION}/7.x /search_api

VOLUME /opt/solr/server/solr/mycores
VOLUME /opt/solr/server/logs
VOLUME /tmp

CMD ["/bin/bash", "-c", "solr-precreate ${SOLR_CORE} /search_api"]
