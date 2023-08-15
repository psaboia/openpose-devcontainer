#!/bin/bash

# Update openpose submodule
git config --global --add safe.directory /workspaces/openpose-devcontainer
git config --global --add safe.directory /workspaces/openpose-devcontainer/3rdparty/caffe
git config --global --add safe.directory /workspaces/openpose-devcontainer/3rdparty/pybind11
git submodule update --init --recursive --remote

# Update python modeules with pdm 
pdm install

# 
mkdir build/
cd build/

cmake ..

make -j`nproc`

cd ..
mkdir ../output
 
# test
./build/examples/openpose/openpose.bin --image_dir examples/media/ --display 0 --write_json output
./build/examples/openpose/openpose.bin --image_dir examples/media/ --display 0  --write_video ./output/openpose-face.avi --face



