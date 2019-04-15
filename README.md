# docker_trilinos

A repository containing different docker containers for Trilinos:

- __dev-jupyter:__ [Docker](https://www.docker.com/) container with [cling](https://root.cern.ch/cling) [jupyter](https://jupyter.org/) kernels and a [Trilinos](https://trilinos.github.io/) installation compatible with the [jupyter](https://jupyter.org/) notebooks in the [tawiesn/trilinos-notebooks](https://github.com/tawiesn/trilinos-notebooks) repository.

# General installation comments

## Installation of Docker

Please refer to [the Docker documentation](https://docs.docker.com/install/) for general installation instructions on all host platforms.

## Clone [docker_trilinos](https://github.com/tawiesn/docker_trilinos) repository

Create a new folder for the [docker_trilinos](https://github.com/tawiesn/docker_trilinos) repository and clone it using, e.g.,
```
mkdir docker_trilinos
git clone https://github.com/tawiesn/docker_trilinos.git docker_trilinos
```
__Note:__ Alternatively, you can also use ssh as protocol instead of https.

## Create the docker image
Change to the `dev_jupyter` folder in the repository
``` 
cd docker_trilinos/dev-jupyter
```
Then create the `dev-jupyter` docker image
```
docker build -t tawiesn/dev-jupyter .
```
This process might take a while. It downloads all the necessary dependencies and builds the software (including clang, cling and Trilinos).

## Clone the [tawiesn/trilinos-notebooks](https://github.com/tawiesn/trilinos-notebooks) repository



## Create a docker container instance from the docker image
Use
```
docker run --rm -it -v /home/tobias/trilinos-notebooks/:/workspace/ -P tawiesn/dev-jupyter
```
