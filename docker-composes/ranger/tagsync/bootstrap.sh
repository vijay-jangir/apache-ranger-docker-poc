#!/bin/bash
set -xe

./setup.sh

./ranger-tagsync-services.sh start
tail -f $(grep 'logdir' ./install.properties  | cut -d'=' -f2)/*
