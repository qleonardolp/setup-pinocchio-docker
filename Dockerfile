FROM ubuntu:noble

LABEL org.opencontainers.image.authors="github.com/qleonardolp"

ENV LANG=en_US.UTF-8

RUN apt-get update && apt-get install -qqy lsb-release curl git

RUN mkdir -p /etc/apt/keyrings && \
    curl http://robotpkg.openrobots.org/packages/debian/robotpkg.asc | tee /etc/apt/keyrings/robotpkg.asc

RUN echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/robotpkg.asc] http://robotpkg.openrobots.org/packages/debian/pub $(lsb_release -cs) robotpkg" \
    | tee /etc/apt/sources.list.d/robotpkg.list

RUN apt-get update && apt-get install -qqy robotpkg-py312-pinocchio

WORKDIR /home/ubuntu
RUN echo 'export PATH=/opt/openrobots/bin:$PATH' >> .bashrc
RUN echo 'export PKG_CONFIG_PATH=/opt/openrobots/lib/pkgconfig:$PKG_CONFIG_PATH' >> .bashrc 
RUN echo 'export LD_LIBRARY_PATH=/opt/openrobots/lib:$LD_LIBRARY_PATH' >> .bashrc 
RUN echo 'export PYTHONPATH=/opt/openrobots/lib/python3.12/site-packages:$PYTHONPATH' >> .bashrc
RUN echo 'export CMAKE_PREFIX_PATH=/opt/openrobots:$CMAKE_PREFIX_PATH' >> .bashrc

# Install meshcat visualizer
RUN apt-get install -qqy libzmq3-dev python3-setuptools
RUN git clone --recursive https://github.com/meshcat-dev/meshcat-python
WORKDIR /home/ubuntu/meshcat-python
RUN python3 setup.py install

# Install useful python libraries
RUN apt-get update && apt-get install -qqy python3-matplotlib

WORKDIR /home/ubuntu
