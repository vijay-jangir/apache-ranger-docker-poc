FROM apache/hive:3.1.3

# Allow buildtime config of HIVE_VERSION
ARG RANGER_VERSION=2.4.0

USER root
ENV RANGER_HIVE_PLUGIN_HOME /opt/ranger-hive-plugin
COPY ranger-${RANGER_VERSION}-hive-plugin.tar.gz /opt/ranger-${RANGER_VERSION}-hive-plugin.tar.gz
COPY ./atlas/atlas-hive-hook /opt/atlas-hive-hook
COPY ./atlas/hive-env.sh /opt/hive/conf/hive-env.sh
COPY ./atlas/atlas-application.properties /opt/hive/conf/atlas-application.properties

RUN tar -xvf /opt/ranger-${RANGER_VERSION}-hive-plugin.tar.gz -C /opt/ \
    && ln -s /opt/ranger-${RANGER_VERSION}-hive-plugin $RANGER_HIVE_PLUGIN_HOME \
    && rm -f /opt/ranger-${RANGER_VERSION}-hive-plugin.tar.gz \
    && rm /opt/tez/lib/jersey*.jar

RUN chown -R hive:hive /opt/atlas-hive-hook
RUN chown -R hive:hive  /opt/ranger-${RANGER_VERSION}-hive-plugin
RUN chown -R hive:hive  $RANGER_HIVE_PLUGIN_HOME

ENV HIVE_SITE_CONF_hive_exec_post_hooks=org.apache.atlas.hive.hook.HiveHook
ENV HIVE_SITE_CONF_atlas_hook_hive_maxthreads=5
ENV HIVE_SITE_CONF_hive_server2_async_exec_threads=100

COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
