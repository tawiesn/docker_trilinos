# build docker container using
#   docker build --build-arg username=user -t tawiesn/dev-trilinos .
# run the container using
#   docker run -i -t tawiesn/dev-trilinos /bin/bash
# This image contains a basic CentOS with a standard development environment
# as well as Trilinos
#
FROM tawiesn/dev-tpl
ARG username=user

#########################
    
# create user (but run the commands as root)
RUN adduser $username
WORKDIR /home/$username

# copy or download trilinos source files
RUN yum update; \
    yum -y install p7zip; \
    yum -y install cmake3; \
    yum -y openmpi-devel; \
    yum clean all

# change user rules
COPY install_trilinos.sh /home/$username/
COPY do-configure /home/$username/
RUN chown $username:$username /home/$username/do-configure
RUN chown $username:$username /home/$username/install_trilinos.sh

########################
# switch to user
########################
USER $username

WORKDIR /home/$username

RUN mkdir trilinos
WORKDIR /home/$username/trilinos
RUN git clone https://github.com/trilinos/Trilinos.git .

RUN echo 'module load mpi/openmpi-x86_64' >> /home/$username/.bash_profile

########################
# switch to user
########################
USER $username
########################
## compile trilinos
# must be run as user!

WORKDIR /home/$username
RUN ./install_trilinos.sh

########################

