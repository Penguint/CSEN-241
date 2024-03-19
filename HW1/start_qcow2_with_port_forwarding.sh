#!/bin/bash

script_dir=$( cd "$( dirname "$0" )" && pwd ) # get the directory of this script

image_file=$script_dir/images/ubuntu.qcow2

qemu-system-x86_64 -drive "file=$image_file",format=qcow2 -m 2G -boot strict=on -nic user,hostfwd=tcp::8888-:22 &