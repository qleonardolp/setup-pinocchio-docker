# Setup Pinocchio Docker

This docker image is based on Ubuntu 24.04 (Noble), with Python 3.12. The Pinocchio visualizer used is [Meshcat](https://github.com/meshcat-dev/meshcat-python).

 - This image is meant to develop rigid body dynamics simulation using the [Pinocchio](https://github.com/stack-of-tasks/pinocchio) library with Python bindings.
 - This image is not meant to develop with ROS2, neither is tested for C++ based simulations.

### Build image:
```bash
$ docker build -t pinocchio:devel .
```
### Running the container, in interactive mode:
```bash
$ docker run -it pinocchio:devel
```
### Once inside the container, run at `/home/ubuntu`:
```bash
 source .bashrc
```

Press `Ctrl+D` to exit the container on the command line.

### After finish using your container, clean up:
```bash
$ docker container prune
```

### Recommended usage

Use VS Code with the official extensions **_Docker_** and **_Dev Containers_** to run the image interactively and attach an instance of VS Code
to the running container. 