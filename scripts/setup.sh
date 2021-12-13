#!/bin/bash

#git clone git@github.com:netgroup/eclat-docker.git
#cd eclat-docker
#git checkout stefano2

git clone git@github.com:netgroup/eclat-daemon.git
cd eclat-daemon
git checkout stefano2

#on windows/WSL the following commands cannot be executed on
#the windows host, they must be executed inside the wsl container
#otherwise the symbolic links does not work
#as a workaround, we use a script in eclat-daemon to delete and
#clone again

git clone git@github.com:netgroup/hike_v3.git
cd hike_v3
git checkout stefano2_post_v3_2
git submodule update --init --recursive
