FROM trinodb/trino:377

ENV RANGER_VERSION 2.4.0

USER root

# Add Ranger Presto Plugin
ENV RANGER_PLUGIN_HOME /usr/lib/trino/ranger-trino-plugin
COPY ranger-${RANGER_VERSION}-trino-plugin.tar.gz /usr/lib/trino/ranger-${RANGER_VERSION}-trino-plugin.tar.gz

WORKDIR /usr/lib/trino
RUN yum install -y gzip procps-ng vim \
    && yum clean all \
    && rm -rf /var/cache/yum

RUN tar -xvf ranger-${RANGER_VERSION}-trino-plugin.tar.gz \
    && ln -s ranger-${RANGER_VERSION}-trino-plugin $RANGER_PLUGIN_HOME \
    && rm -f ranger-${RANGER_VERSION}-trino-plugin.tar.gz

# COPY lib/* ${RANGER_PLUGIN_HOME}/lib/ranger-trino-plugin-impl/

ADD run.sh /run.sh

ENTRYPOINT ["/run.sh"]
