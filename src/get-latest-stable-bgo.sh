#!/usr/bin/env bash

{ git checkout master && git branch -d current; git fetch -vv --all && git pull ; } && \
[ ! -z "${version:=$(git tag -l|grep -P "^\d+\.\d+\.\d+$"|tail -n 1)}" ] \
    && git checkout tags/${version} -b current \
    || { echo version not found >&2; exit 1; }
