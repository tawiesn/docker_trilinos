#!/bin/bash -i

echo `pwd` > ~/.TPL_BASEDIR

# create folder structure and move files to correct place
TPL_BASEDIR=`pwd`
# generate escaped version of base directory (needed for sed)
sed -e 's/\//\\\//g' ~/.TPL_BASEDIR > ~/.TPL_BASEDIRESC
TPL_BASEDIRESC=`cat ~/.TPL_BASEDIRESC`

## load MPI module
echo "Load MPI module"
module load mpi/openmpi-x86_64

## check used openmpi version (module)

# build boost 1.55
cd $TPL_BASEDIR
wget http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.gz
tar xzf boost_1_55_0.tar.gz
mv boost_1_55_0 boost
cd boost
echo "using mpi : mpicxx ;" >> ./tools/build/v2/user-config.jam
./bootstrap.sh --with-libraries=signals,regex,filesystem,system,mpi,serialization,thread,program_options,exception --prefix=$TPL_BASEDIR/boost/build
./b2 -j 4
./b2 -j 4 install
cd ..


# install hdf5
cd $TPL_BASEDIR
wget https://www.hdfgroup.org/ftp/HDF5/releases/hdf5-1.8.9/src/hdf5-1.8.9.tar.gz
tar xzf hdf5-1.8.9.tar.gz
cd hdf5-1.8.9
mkdir build
mkdir build/include
mkdir build/lib
./configure CC=mpicc FC=mpif90 CXX=mpicxx CXXFLAGS="-fPIC -O3" CFLAGS="-fPIC -O3" FCFLAGS="-fPIC -O3" --enable-parallel --enable-hl --with-zlib=/usr/lib64 --prefix=$TPL_BASEDIR/hdf5-1.8.9/build
make -j 4
make install
cd ..

# install netcdf
cd $TPL_BASEDIR
wget https://github.com/Unidata/netcdf-c/archive/v4.3.1.1.tar.gz
mv v4.3.1.1.tar.gz netcdf-c-4.3.1.1.tar.gz
tar -zxvf netcdf-c-4.3.1.1.tar.gz
cd netcdf-c-4.3.1.1
mkdir build
mkdir build/include
mkdir build/lib
./configure --prefix=$TPL_BASEDIR/netcdf-c-4.3.1.1/build CC=mpicc FC=mpif90 CXX=mpicxx CFLAGS="-I$TPL_BASEDIR/hdf5-1.8.9/build/include -O3 -fPIC" LDFLAGS=-L$TPL_BASEDIR/hdf5-1.8.9/build/lib --disable-fsync --disable-cdmremote --disable-dap --disable-doxygen --enable-netcdf-4 --enable-option-checking
# --enable-pnetcdf
make -j 4
make install
cp -r include/ build/include/
cp -r liblib/ build/lib/
cd ..

# install parmetis
cd $TPL_BASEDIR
wget http://glaros.dtc.umn.edu/gkhome/fetch/sw/parmetis/parmetis-4.0.3.tar.gz
tar xvfz parmetis-4.0.3.tar.gz
cd parmetis-4.0.3
make config prefix=$TPL_BASEDIR/parmetis-4.0.3/build
make
make install
cd metis
make config prefix=$TPL_BASEDIR/parmetis-4.0.3/build
make
make install

cd $TPL_BASEDIR


# install SuperLu 4.3
# Linker problem with superlu...
#cd $TPL_BASEDIR
#wget http://crd-legacy.lbl.gov/~xiaoye/SuperLU/superlu_4.3.tar.gz
#tar -xvf superlu_4.3.tar.gz
#cp drekar-superlu-make.inc make.inc-temp
#sed -e 's/XXTPL_BASEDIRXX/'$TPL_BASEDIRESC'/g' make.inc-temp > make.inc
#cp make.inc SuperLU_4.3/make.inc
#rm make.inc
#rm make.inc-temp
#cd SuperLU_4.3
#mkdir build
#mkdir build/include
#mkdir build/lib
#make -j 2
#cd SRC
#cp *.h $TPL_BASEDIR/SuperLU_4.3/build/include
#cd ..
#cp $TPL_BASEDIR/SuperLU_4.3/lib/libsuperlu_4.3.a $TPL_BASEDIR/SuperLU_4.3/build/lib
#cd ..

# PAPI
#cd $TPL_BASEDIR
#wget http://icl.cs.utk.edu/projects/papi/downloads/papi-5.4.1.tar.gz
#tar -xvf papi-5.4.1.tar.gz
#cd papi-5.4.1
#cd src
#./configure --prefix=$TPL_BASEDIR/papi-5.4.1/build
#make 
#make install
#cd ..
#cd ..


