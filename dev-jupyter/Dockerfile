# docker run --rm -it -P -v /path/to/workspace:/workspace -v /path/to/mnt:/mnt tawiesn/dev-jupyter
# run with 
#   docker run --rm -it -p 192.168.99.100:8888:8888 -P tawiesn/dev-jupyter /bin/bash
#   docker run --rm -it -p 192.168.99.100:8888:8888 -v /Users/tawiesn/workspace:/workspace -P tawiesn/dev-jupyter /bin/bash
# access through 
#   192.168.99.100:8888
#
#  docker run --rm -it -p 127.0.0.1:8888:8888 -v /home/tobias:/workspace -P tawiesn/dev-jupyter /bin/bash
#    connect to 192.168.178.130:255.255.255.0 and 172.17.0.22:255.255.0.0 gw 192.17.0.1
#    in browser use 127.0.0.1:8888
#
# docker run --rm -it -p 172.17.42.1:8888:8888 -v /home/tobias:/workspace -P tawiesn/dev-jupyter /bin/bash
#    add route to 172.17.42.1
#
# docker build -t tawiesn/dev-jupyter .
FROM centos:latest
MAINTAINER Tobias Wiesner <wiesner.t@web.de>

RUN set -x
RUN yum -y update;
RUN yum -y install build-essential make git;
RUN yum -y install wget vim nano;


RUN yum -y install less epel-release htop environment-modules wget nano
RUN yum -y install gcc gcc-gfortran gcc-c++
RUN yum -y install openmpi openmpi-devel hdf5 hdf5-devel hdf5-openmpi hdf5-openmpi-devel
RUN yum -y install netcdf netcdf-devel netcdf-openmpi-devel netcdf-openmpi
RUN yum -y install blas blas-devel lapack lapack-devel boost boost-devel atlas atlas-devel
RUN yum -y install python36 python36-devel python36-pip
RUN yum -y install cmake3

RUN yum clean all;

# copy cling installation script from cern
COPY clone.sh /root/clone.sh

RUN chmod u+x /root/clone.sh

RUN set -x && /root/clone.sh

RUN set -x
RUN pip3 install --upgrade pip
RUN pip3 install jupyter
WORKDIR /opt/clang/share/cling/Jupyter/kernel
RUN pip3 install -e .
RUN jupyter-kernelspec install cling-cpp17
RUN jupyter-kernelspec install cling-cpp14
RUN jupyter-kernelspec install cling-cpp11
ENV PATH /inst/bin:$PATH

## copy notebook configuration file
COPY jupyter_notebook_config.py /root/.jupyter/
EXPOSE 8888 

RUN yum -y install texlive-collection-xetex texlive-adjustbox texlive-upquote texlive-eurosym texlive-ucs texlive-collection-latexrecommended
RUN yum -y install pandoc pandoc-pdf

RUN mkdir /workspace

## change user rules
COPY install_trilinos.sh /root/
COPY do-conf-tp-serial /root/

RUN mkdir /root/trilinos
WORKDIR /root/trilinos
RUN git clone https://github.com/trilinos/Trilinos.git .
WORKDIR /root
COPY do-conf-tp-serial /root/
RUN ./install_trilinos.sh

RUN pip3 install jupyter_contrib_nbextensions
RUN pip3 install jupyter_nbextensions_configurator
RUN jupyter nbextensions_configurator enable --user
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension

env PATH /opt/clang/bin/:$PATH
env LD_LIBRARY_PATH /root/install/do-conf-tp-serial/lib/:$LD_LIBRARY_PATH

WORKDIR /workspace
COPY *.ipynb /workspace/


## Add Tini. Tini operates as a process subreaper for jupyter. This prevents
### kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "jupyter", "notebook", "--", "--allow-root", "--port=8888"]

##EXPOSE 8888
#CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
