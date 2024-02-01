#!/bin/bash

script_dir=$( cd "$( dirname "$0" )" && pwd ) # get the directory of this script

image_file=$script_dir/images/ubuntu.raw

qemu-system-x86_64 -drive "file=$image_file,format=raw" -m 2G -boot strict=on