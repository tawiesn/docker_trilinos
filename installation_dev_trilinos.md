# Installation instructions for dev-trilinos container

## Prepare pre-requisites

The [dev-trilinos](dev-trilinos) docker container is based on the [dev-base](dev-base) and [dev-tpl](dev-tpl) containers which provide the base system (a pure CentOS Linux system with compilers) and an installation of some useful TPLs for Trilinos.

### Build dev-base container

Run
```
cd docker_trilinos/dev-base
docker build -t tawiesn/dev-base .
```
to build the [dev-base](dev-base) image.

### Build dev-tpl container

Run
```
cd docker_trilinos/dev-tpl
docker build -t tawiesn/dev-tpl .
```
to build the [dev-tpl](dev-tpl) image.

## Build the dev-trilinos container

### General instructions

Use the following command to build the [dev-trilinos](dev-trilinos) docker image
```
cd docker_trilinos/dev-trilinos
docker build --build-arg username=user -t tawiesn/dev-trilinos .
```

This command clones the current Trilinos main repository into the container and installs it using the configuration from the [dev-trilinos/do-configure](dev-trilinos/do-configure) file.

Create an instance of the [dev-trilinos](dev-trilinos) docker container via
```
docker run -it --rm tawiesn/dev-trilinos /bin/bash
```
to run a bash instance within the docker container.

<b>Please note:</b> To use OpenMPI within the docker container you first need to run
```
module load mpi/openmpi-x86_64
```
in the bash in your docker container.

## Build your own trilinos docker container

The easiest way to build your own docker container with your own user-specific Trilinos configuration is the following
* Create a copy of the [dev-trilinos](dev-trilinos) folder and name it as you like, e.g., `my-dev-trilinos`
* Adapt the `my-dev-trilinos/do-configure` file. Specifically, enable all the Trilinos packages and options that you need.
* Build your docker container using the standard commands (as above)
  ```
  cd docker_trilinos/my-dev-trilinos
  docker build --build-arg username=user -t my-github-username/my-dev-trilinos .
  ```
  After the `my-dev-trilinos` image has been created you can create an instance with the command
  ```
  docker run -it --rm t my-github-username/my-dev-trilinos /bin/bash
  ```
