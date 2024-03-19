
# Run CPU test
sysbench --test=cpu1 --cpu-max-prime=10000 run
sysbench --test=cpu2 --cpu-max-prime=100000 run

# Run memory test
sysbench --test=mem1 --memory-block-size=1G run
sysbench --test=mem2 --memory-block-size=2G run

# Run fileIO test
sysbench --file-test-mode=rndwr --file-total-size=5G run
sysbench --file-test-mode=rndrw --file-total-size=5G run

# Shutdown VM
shutdown now

