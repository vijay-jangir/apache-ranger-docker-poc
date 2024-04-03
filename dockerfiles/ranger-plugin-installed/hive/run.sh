#!/bin/bash

hadoop fs -mkdir       /tmp
hadoop fs -mkdir -p    /user/hive/warehouse
hadoop fs -chmod g+w   /tmp
hadoop fs -chmod g+w   /user/hive/warehouse

cd $HIVE_HOME/bin

if [ "$1" == "metastore" ]
then
  ./schematool -dbType mysql -initSchema --verbose || echo "Schema setup failed, if it was not setup earlier the setup may be currupt"
  ./hive --service metastore
else
  echo "execute the default, which is hiveserver2"
  $RANGER_HIVE_PLUGIN_HOME/enable-hive-plugin.sh &&
  ./hiveserver2  --hiveconf hive.server2.enable.doAs=true
fi
