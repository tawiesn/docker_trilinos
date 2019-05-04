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
 
 - __dev-trilinos:__ Example for a [Docker](https://www.docker.com) container with a regular [Trilinos](https://trilinos.github.io/) installation. It is based on CentOS and OpenMPI with a GCC compiler and some TPLs. It only contains a small number of Trilinos packages. It serves as an example which should be adapted to your specific needs as described in the [installation instructions](installation_dev_trilinos.md).
 The Trilinos installation only contains the following packages:
   * Amesos
   * AztecOO
   * Belos
   * Isorropia
   * Kokkos
   * ML
   * Stratimikos
   * Zoltan
   
   There is support for OpenMPI, OpenMP, HDF5 and Netcdf enabled.

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
  

