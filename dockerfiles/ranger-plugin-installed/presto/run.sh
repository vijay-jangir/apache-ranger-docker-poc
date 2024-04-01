#!/bin/bash

/usr/lib/trino/ranger-trino-plugin/enable-trino-plugin.sh && exec /usr/lib/trino/bin/launcher run "$@"