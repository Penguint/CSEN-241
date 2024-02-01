#!/bin/bash

script_dir=$( cd "$( dirname "$0" )" && pwd ) # get the directory of this script

iso_file=$script_dir/images/ubuntu-20.04.6-live-server-amd64.iso
image_file=$script_dir/images/ubuntu.qcow2

qemu-system-x86_64 -hda "$image_file" -boot d -cdrom "$iso_file" -m 2G -boot strict=on -nographic