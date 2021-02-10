#!/bin/bash

rm -rf /home/ubuntu/network
git clone --recurse-submodules -j8 https://github.com/futurewei-cloud/network.git /home/ubuntu/network

make -C /home/ubuntu/network
make install -C /home/ubuntu/network

if [[ "$(docker images -q buildbox:v2 2> /dev/null)" == "" ]]; then
	echo "Building docker image"
	sudo docker build -f /home/ubuntu/network/scripts/Dockerfile -t buildbox:v2 /home/ubuntu/network/scripts
fi
