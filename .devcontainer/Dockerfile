FROM nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04

# Update and install basic libraries
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
  python3-pip \
  python3-dev \
  python3-venv \
  python3-virtualenv \
  build-essential git wget

ARG DEBIAN_FRONTEND=noninteractive
ARG DOCKER_BUILDKIT=plain


# Install PDM
#RUN curl -sSLO https://pdm.fming.dev/install-pdm.py
#RUN curl -sSL https://pdm.fming.dev/install-pdm.py.sha256 | shasum -a 256 -c -
#RUN python3 install-pdm.py 
#RUN echo 'export PATH="${HOME}/.local/bin:${PATH}"' >> ~/.bashrc

# Install Openpose Prerequisites
# See https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/installation/1_prerequisites.md#ubuntu-prerequisites

# 1. Install CMake QT GUI
RUN apt-get install cmake-qt-gui -y 

# 2. Install Nvidia GPU version prerequisites
# 2.1. Install CUDA
# 2.2. Install cuDNN

# 3. Install OpenCV
RUN apt-get install libopencv-dev -y

# 5. Install Caffe prerequisites
COPY install_deps.sh /tmp/install-tmp/
RUN if [ -f "/tmp/install-tmp/install_deps.sh" ]; then umask 0002 && bash /tmp/install-tmp/install_deps.sh && rm -rf /tmp/install-tmp; fi

# 6. CMake config generation prerequisites 
RUN  apt install protobuf-compiler libgoogle-glog-dev 

# 7. OpenPose make prerequisites
RUN apt install libboost-all-dev libhdf5-dev libatlas-base-dev

# 8. [optional] Python prerequisites
# Uncomment it only if you plan to use the Python API
# RUN pip3 install numpy opencv-python