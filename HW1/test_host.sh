#!/bin/bash

disk_types=("raw" "qcow2")
cpu_configs=(1 4)
memory_sizes=("2G" "8G")

for disk_type in "${disk_types[@]}"; do
    for cpu_config in "${cpu_configs[@]}"; do
        for memory_size in "${memory_sizes[@]}"; do
            # Start VM with current configuration
            qemu-system-x86_64 -drive "file=./images/ubuntu.$disk_type",format=$disk_type -cpu $cpu_config -m $memory_size -boot strict=on -nic user,hostfwd=tcp::8888-:22 &
            
            # Wait for VM to be ready
            sleep 120
            
            ssh -p 8888 qizhe@localhost << EOF
./sysbench_script.sh
EOF

            # Shutdown VM
            ssh -p 8888 qizhe@localhost << EOF
shutdown now
EOF
        done
    done
done