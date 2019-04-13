#!/bin/bash -i

# create folder structure and move files to correct place
TRILINOS_SRCDIR=/root/trilinos
TRILINOS_BUILDDIR=/root/build/do-conf-tp-serial

TPL_BASEDIR=/opt/tpls

## load MPI module
#echo "Load MPI module"
#module load mpi/openmpi-x86_64

## run configuration
cd ~
./do-conf-tp-serial

## build trilinos
cd $TRILINOS_BUILDDIR
make -j 4
make install
cd ~

rm -Rf $TRILINOS_BUILDDIR

## link MueLu tutorial data
##ln -s ~/trilinos-build/packages/muelu/doc/Tutorial/src muelu-tutorial
