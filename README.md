# eclat-docker

This project is used to build the container for test and development of the HIKe / eCLAT framework.
See the user documentation here: https://hike-eclat.readthedocs.io/

The main source code repositories are:

* [eclat-daemon](https://github.com/netgroup/eclat-daemon) (eCLAT daemon, CLI, eCLAT language parser)
* [HIKe](https://github.com/netgroup/hike-public) (HIKe core functionality)

## Instructions to build and execute the container on Linux

```shell
git clone https://github.com/netgroup/eclat-docker/
cd eclat-docker
scripts/setup.sh
```
#### Build the docker Image

```shell
docker build -t eclat:latest .
```
#### Create and execute the container

```shell
docker run -w /opt/eclat-daemon/ --rm -ti --privileged --init --name eclat -v $(pwd)/eclat-daemon:/opt/eclat-daemon eclat:latest
```

Note that a local folder called eclat-daemon in your host will be linked to to the /opt/eclat-daemon folder in the container.

## Instructions to build and execute the container on Windows with WSL

Run the following inside git bash

```shell
git clone https://github.com/netgroup/eclat-docker/
cd eclat-docker
scripts/setup.sh
```
#### Build the docker Image

In windows command line, go in the eclat-docker folder and run:
```shell
docker build -t eclat:latest .
```

#### Create and execute the container
In windows command line, in the eclat-docker folder, run:

```shell
docker run -w /opt/eclat-daemon/ --rm -t -i --privileged --init --name eclat -v %cd%\eclat-daemon:/opt/eclat-daemon eclat:latest
```

Note that a local folder called eclat-daemon in your host will be linked to the /opt/eclat-daemon folder in the container.

#### IMPORTANT: Fix the symbolic links issues in windows

Immediately after that the contatiner is created with the above command, inside the container you have to run:

```shell
cd /opt/eclat-daemon
scripts/setup-wsl.sh
```

## Further instructions (both for Linux and Windows)

#### Execute a shell on a running container

```shell
docker exec -it eclat bash
```
#### How to perform the example experiments in the container

Please see: https://hike-eclat.readthedocs.io/en/latest/experiments.html

#### Copy your credentials (needed for development)

Copy a file named `github_rsa` with your private key in the folder `/opt/eclat-daemon/scripts/temp_credentials/`

Run the following script inside the container (the script copies the credentials in the home folder of the root user) :

```shell
cd /opt/eclat-daemon
scripts/copy-credentials.sh
```
It is also useful to globally configure the git email and name, this can be done using two optiona parameters:

```shell
cd /opt/eclat-daemon
scripts/copy-credentials.sh you@example.com "Your Name"
```

#### Build docker Image for Testbed

```shell
scripts/setup.sh
docker build -t eclat:testbed . --file ./Dockerfile-testbed
```

#### Save and Load eCLAT testbed docker image

```shell
docker save eclat:testbed | gzip > eclat.tar.gz
```

Download the image eclat.tar.gz

```shell
docker load < eclat.tar.gz
```

#### Create and execute container

```shell
docker run --rm -t -i --privileged --name eclat eclat:testbed  /sbin/my_init -- bash -l 
```
#### Execute a unit test for eclat

```shell
cd /opt/eclat-daemon
python -m unittest test.test_parser
```

#### Development of eCLAT packages

By default, eCLAT packages repositories are cloned using https: addresses as git remotes. If you want to push changes to an eCLAT package repository, you might want to set the git origin to SSH (you need write permissions for the repository). You can do this using the following script:

```
scripts/git-origin-ssh.sh
```

The script needs to be executed from the folder in the components folder, using the proper relative path to call it.

