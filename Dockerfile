FROM debian:buster
RUN apt-get update
RUN apt-get install -y libopenblas-dev libblas-dev m4 cmake cython python3-dev python3-yaml python3-setuptools python3-wheel python3-pillow python3-numpy libatlas3-base python3-pip zlib1g-dev libjpeg-dev gfortran libfreetype6-dev pkg-config python3-venv git flex bison
WORKDIR /opt/install
COPY requirements.txt .
COPY torch-1.3.0a0+deadc27-cp37-cp37m-linux_armv7l.whl .
COPY torchvision-0.4.0a0+d31eafa-cp37-cp37m-linux_armv7l.whl .
RUN pip3 install numpy
RUN python3 -m pip install Pillow==6.1
RUN pip3 install torch-1.3.0a0+deadc27-cp37-cp37m-linux_armv7l.whl
RUN pip3 install torchvision-0.4.0a0+d31eafa-cp37-cp37m-linux_armv7l.whl
RUN pip3 install fastai --no-deps
RUN pip3 install -r requirements.txt
