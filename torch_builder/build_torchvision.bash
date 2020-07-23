#!/bin/bash

TORCHVISION_VERSION=v0.6.1

export NO_CUDA=1
export NO_DISTRIBUTED=1
export NO_MKLDNN=1
export NO_NNPACK=1
export NO_QNNPACK=1

rm -rf build
mkdir build
cd build

git clone --recursive https://github.com/pytorch/vision.git
cd vision
git checkout $TORCHVISION_VERSION

python3 setup.py build
python3 setup.py bdist_wheel

mv dist/*.whl ../../../
