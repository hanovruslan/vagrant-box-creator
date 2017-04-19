#!/usr/bin/env bash

name=${1:-example}
path="${2:-./examples}"
file=${3:-${name}.vagrantfile}

export name=${name} \
&& export path=${path} \
&& export file=${file} \
&& vagrant up --provision
