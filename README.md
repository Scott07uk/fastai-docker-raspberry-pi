# Purpose

This is the source to produce a working docker image with pyTorch and fast.ai which can run on Raspian Linux (32 bit) on a Raspberry Pi.  The intention is that this would form a base image which you can build your models into and serve them as part of a wider application or a microservice running on a Raspberry Pi.  As a lightweight, cheap and powerful single board computer the Raspberry Pi is ideally suited to running applications in an edge environment and with machine learning growing in popularity this docker image can be used to deploy pyTorch or fast.ai images.

# References

This has been put together thanks to some helpful articles on medium.com:

https://medium.com/hardware-interfacing/how-to-install-pytorch-v4-0-on-raspberry-pi-3b-odroids-and-other-arm-based-devices-91d62f2933c7

# Prebuilt Images

If you just want to use pytorch or fast.ai on a Raspberry Pi via Docker you can just download the images from here:

https://hub.docker.com/repository/docker/scott07uk/fastai-raspberry-pi

These have all been built on a Raspberry Pi 4 with 4GB RAM on 32 bit command line Raspian Linux.  However they should be suitable for any operating system used on a Raspberry Pi where docker can be installed (though this is untested).

# Building Your Own Images

The following python modules are loaded:

- numpy
- Pillow
- scipy
- requests
- pyyaml
- pandas
- waitress
- flask

If you do not need any further python modules installed then you can just use this one of our images as a base, add your python files and and set the command to run.  Note that you need to run python3 rather than just python

Should you need to install other python libraries you will need to do this on a raspberry pi itself as the format of the binaries is all compiled for the ARM architecture and will not run on x86 / x64 machines.  We would suggest you use one of our images as a base then use pip3 to install the other libraries you need.

# Rebuilding Our Images

You can rebuilt our images on a Raspberry Pi just by using docker.  The compiled wheels for pyTorch and torchvision are checked in to make things a little easier.  The requirements.txt file can be edited to add in extra python libraries which will be installed via pip3.  Alternatively you can install software using apt.  The base image is built on Debian Linux for arm, so you have full access to Debian's extensive package library. 

Within the torch_builder directory there is two scripts to build pyTorch and torchvision, these will be built for the architecture were the process is running from.  There is no checks to make sure you are running on a Raspberry Pi so these scripts can be used to build wheels of pyTorch and torchvision for any platform.  The builds are optimised for INFERENCE ONLY, they will be compiled without CUDA support so these will be unsuitable for training.  The versions built are defined at the top of the file in variables, these should refer to tags which the repositories have been tagged with.

NOTE: When building torchvision the torch wheel itself must be installed before torchvision will compile.  There are also a number of development dependencies needed which you may need to install.