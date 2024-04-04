#!/bin/sh

export MANAGE_LOCAL_HBASE=true
export MANAGE_LOCAL_SOLR=true
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk

# /opt/atlas/ranger-atlas-plugin/enable-atlas-plugin.sh
/opt/atlas/bin/atlas_start.py
echo "Atlas started"

tail -f /opt/atlas/logs/*
