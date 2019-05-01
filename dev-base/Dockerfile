# build docker container using
#   docker build -t tawiesn/dev-base .
# run the container using
#   docker run -i -t tawiesn/tcoe1 /bin/bash
#
# This image contains a basic CentOS with a standard development environment
# (compilers, MPI, ...)
#
FROM centos:latest

RUN yum -y install less epel-release htop environment-modules wget nano
RUN yum -y install automake make cmake csh
RUN yum -y install gcc gcc-gfortran gcc-c++
RUN yum -y install openmpi openmpi-devel hdf5 hdf5-devel hdf5-openmpi hdf5-openmpi-devel
RUN yum -y install netcdf netcdf-devel netcdf-openmpi-devel netcdf-openmpi
RUN yum -y install blas blas-devel lapack lapack-devel boost boost-devel atlas atlas-devel
RUN yum -y install git git-all

RUN echo root:Docker | chpasswd
