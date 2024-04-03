FROM ranger-base:2.4.0

ENV RANGER_TAGSYNC_HOME /opt/ranger_tagsync

RUN tar -zxvf $RANGER_HOME/target/ranger-$RANGER_VERSION-tagsync.tar.gz -C /opt \
    && ln -s /opt/ranger-$RANGER_VERSION-tagsync $RANGER_TAGSYNC_HOME \
    && rm -rf $RANGER_HOME

WORKDIR $RANGER_TAGSYNC_HOME
