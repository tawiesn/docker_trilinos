# build docker container using
#   docker build -t tawiesn/dev-tpl .
# run the container using
#   docker run -i -t tawiesn/dev-tpl /bin/bash
#
# This image contains a basic CentOS with a standard development environment
# (compilers, MPI, ...)
#
FROM tawiesn/dev-base

# Compile dependencies and TPLs for Trilinos
RUN mkdir /opt/tpls/
WORKDIR /opt/tpls

# Copy TPL sources into image
WORKDIR /opt/tpls

RUN wget http://tawiesn.de/install_dependencies.sh
RUN chmod 750 install_dependencies.sh
RUN /opt/tpls/install_dependencies.sh

