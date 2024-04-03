#!/bin/bash
set -xe

./setup.sh
ranger-admin start
tail -f logfile ews/logs/catalina.out
