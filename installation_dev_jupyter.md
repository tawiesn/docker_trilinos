# Installation of dev_jupyter docker container

## Create the docker image
Change to the `dev-jupyter` folder in the repository
``` 
cd docker_trilinos/dev-jupyter
```
Then create the `dev-jupyter` docker image
```
docker build -t tawiesn/dev-jupyter .
```
This process might take a while. It downloads all the necessary dependencies and builds the software (including clang, cling and Trilinos).

## Clone the [tawiesn/trilinos-notebooks](https://github.com/tawiesn/trilinos-notebooks) repository

Create a new folder for the Trilinos notebooks, e.g.
```
cd
mkdir trilinos-notebooks
git clone https://github.com/tawiesn/trilinos-notebooks.git trilinos-notebooks
```
The [tawiesn/trilinos-notebooks](https://github.com/tawiesn/trilinos-notebooks) repository contains a set of cling notebooks with tutorials for different Trilinos packages. Those cling jupyter notebooks can be used with the `dev-jupyter` docker container, that is created from the docker image in the next step.

## Create a docker container instance from the docker image
Use
```
docker run --rm -it -v /home/user/trilinos-notebooks/:/workspace/ -P tawiesn/dev-jupyter
```
to create a new instance of the docker image in a new docker container. 
> With the `-v /home/user/trilinos-notebooks/:/workspace/` the folder `/home/user/trilinos-notebooks` of the host machine is mounted into the docker container and accessible from within the docker container through the `workspace` folder. Replace the `/home/user/trilinos-notebooks/` by the folder on your host machine where you have cloned the [tawiesn/trilinos-notebooks](https://github.com/tawiesn/trilinos-notebooks) repository.

## Connect with docker container

Run the following command
```
docker ps -a
```
to list all running docker containers and get the associated name of the docker container running the jupyter server. The name of the docker container is given in the last column of the outut of the `docker ps` command.

Then use the command
```
docker inspect brave_colden | grep IPAddress
```
to find the IP address of the docker container. Replace the `brave_colden` by the name of your docker container.

The result should contain the IP address of the docker container, e.g., 172.17.0.2, depending on the network configuration of your machine.

Open a brwoser like firefox and type into the address bar
```
172.17.0.2:8888
```
Replace the IP adress by the IP address you've got from the `docker inspect` call. You should see the jupyter file browser:

![alt text](https://github.com/tawiesn/docker_trilinos/blob/master/jupyter-browser.jpg "Jupyter file browser")

To load a jupyter notebook, just click on it in the jupyter file browser:

![alt text](https://github.com/tawiesn/docker_trilinos/blob/master/jupyter-epetra-tutorial.jpg "Jupyter file browser")

## Direct access to the underlying container

If you need access to the container and the underlying CentOS Linux installation, you can open a terminal in the browser and run the `bash`:

![alt text](https://github.com/tawiesn/docker_trilinos/blob/master/jupyter-menu.jpg "Jupyter file browser")

![alt text](https://github.com/tawiesn/docker_trilinos/blob/master/jupyter-terminal.jpg "Jupyter file browser")
