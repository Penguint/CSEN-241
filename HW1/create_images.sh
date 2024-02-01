#!/bin/bash

script_dir="$( cd "$( dirname "$0" )" && pwd )" # get the directory of this script
output_dir="$script_dir/images" # set the output directory

formats=(raw qcow2) # set the formats to create

for format in ${formats[@]}; do
    qemu-img create "$output_dir/ubuntu.$format" 10G -f $format # create the image
done