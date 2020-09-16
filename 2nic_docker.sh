#!/bin/sh

# script to start docker container with 2 network interfaces
# container not doing routing, just traffic that need to be placed in the correct network to reach destination

# https://stackoverflow.com/questions/34110416/start-container-with-multiple-network-interfaces


docker network create --driver=bridge data22 --subnet=10.22.22.0/24
docker network create --driver=bridge pub128 --subnet=128.3.32.0/22 

# actually, the example used are on the 172.17.x.x network for docker
# bridge create additional private channel for private inter-container networking
# not so much to bridge on the host network
# the above does not seems to create properly routed network.

docker create -it  --network=pub128 --name fatboy tin6150/perf_tools  # -it and bash are optional and used for interactive shell purpose
docker network connect data22 fatboy
docker start -ai fatboy  # -a = attach, -i = interactive

# bash, zsh, sleep,  of them fail with tty error 
# /usr/bin/sleep: /usr/bin/sleep: cannot execute binary file
# failed to resize tty, using default size

# seems to work after changing dockerfile entrypoint to be "/usr/bin/bash", "-l", "-i"

# docker rm fatboy
