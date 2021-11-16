#!/bin/bash

#git clone git@github.com:netgroup/eclat-docker.git
#cd eclat-docker
#git checkout stefano2
git clone git@github.com:netgroup/eclat-daemon.git
cd eclat-daemon
git checkout stefano2
git clone git@github.com:netgroup/hike_v3.git
cd hike_v3
git checkout stefano2
git submodule update --init --recursive
