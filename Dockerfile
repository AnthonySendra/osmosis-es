FROM java:8-jre

RUN wget -P /tmp http://bretth.dev.openstreetmap.org/osmosis-build/osmosis-latest.tgz && \
    mkdir /opt/osmosis && \
    tar -zxvf /tmp/osmosis-latest.tgz -C /opt/osmosis && \
    rm /tmp/osmosis-latest.tgz

ENV JAVACMD_OPTIONS -server -Xmx2G
ENV OSMOSIS_HOME /opt/osmosis
ENV PATH $PATH:$OSMOSIS_HOME/bin

RUN wget -P /tmp http://downloads.sourceforge.net/project/es-osmosis/releases/elasticsearch-osmosis-plugin-1.4.0.jar && \
    mv /tmp/elasticsearch-osmosis-plugin-1.4.0.jar $OSMOSIS_HOME/lib/default/ && \
    echo "org.openstreetmap.osmosis.plugin.elasticsearch.ElasticSearchWriterPluginLoader" > $OSMOSIS_HOME/config/osmosis-plugins.conf

ENTRYPOINT ["/opt/osmosis/bin/osmosis"]