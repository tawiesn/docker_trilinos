# docker_trilinos

A repository containing different docker containers for Trilinos:

- __dev-jupyter:__ [Docker](https://www.docker.com/) container with [cling](https://root.cern.ch/cling) [jupyter](https://jupyter.org/) kernels and a [Trilinos](https://trilinos.github.io/) installation compatible with the [jupyter](https://jupyter.org/) notebooks in the [tawiesn/trilinos-notebooks](https://github.com/tawiesn/trilinos-notebooks) repository.<p>
The Trilinos installation has the following features enabled
  * <b style='color:red'>No MPI support</b>
  * Epetra
  * Tpetra (NO=serial, phtreads; GO=int; SC=double, int)
  * Xpetra
  * MueLu
  * Zoltan/Zoltan2
  * AztecOO/Belos
  * Amesos/Amesos2
  * Galeri
  * Ifpack/Ifpack2
  * Teko
 
 See [here](installation_dev_jupyter.md) for the installation instructions.


# General instructions for installation

## Installation of Docker

Please refer to [the Docker documentation](https://docs.docker.com/install/) for general installation instructions on all host platforms.

## Clone [docker_trilinos](https://github.com/tawiesn/docker_trilinos) repository

Create a new folder for the [docker_trilinos](https://github.com/tawiesn/docker_trilinos) repository and clone it using, e.g.,
```
mkdir docker_trilinos
git clone https://github.com/tawiesn/docker_trilinos.git docker_trilinos
```
__Note:__ Alternatively, you can also use ssh as protocol instead of https.

## Create the docker images

  * <b>dev-trilinos:</b> See [here](installation_dev_trilinos.md) for the installation instructions of the dev-trilinos image.
  * <b>dev-jupyter:</b> See [here](installation_dev_jupyter.md) for the installation instructions of the dev-jupyter image.
  

