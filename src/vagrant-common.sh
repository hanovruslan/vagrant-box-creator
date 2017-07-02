#!/usr/bin/env bash

machine_name="${1:-default}"
vagrantfile_path="${2:-./examples}"

export machine_name="${machine_name}"
export vagrantfile_path="${vagrantfile_path}"
