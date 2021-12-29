# eclat-docker

## Instructions to build and execute the container on Linux

```shell
git clone https://github.com/netgroup/eclat-docker/
cd eclat-docker
scripts/setup.sh
```
#### Build docker Image

```shell
docker build -t eclat:latest .
```
#### Create and execute container

```shell
docker run --rm -t -i --privileged --name eclat -v $(pwd)/eclat-daemon:/opt/eclat-daemon eclat:latest  /sbin/my_init -- bash -l
```

Note that a local folder called eclat-daemon in your host will be linked to a folder in the container.

## Instructions to build and execute the container on Windows with WSL

```shell
git clone https://github.com/netgroup/eclat-docker/
cd eclat-docker
scripts/setup.sh
```
#### Build docker Image
(replace c:\Users\Stefano\eclat-docker\ with your path)

```shell
docker run --rm -t -i --privileged --name eclat -v c:\Users\Stefano\eclat-docker\eclat-daemon:/opt/eclat-daemon eclat:latest  /sbin/my_init -- bash -l
```

Note that a local folder called eclat-daemon in your host will be linked to a folder in the container.

#### Fix the symbolic links issues in windows

inside the container:

```shell
cd /opt/eclat-daemon
scripts/setup-wsl.sh
```

## Further instructions (both for Linux and Windows)

#### Execute a shell on a running container

```shell
docker exec -it eclat bash
```
#### Copy your credentials (needed for development)

Copy a file named /opt/eclat-daemon/scripts/temp_credentials/github_rsa with your private key to the home folder of the root user.

inside the container:

```shell
cd /opt/eclat-daemon
scripts/copy-credentials.sh
```

#### Build docker Image for Testbed

```shell
scripts/setup.sh
docker build -t eclat:testbed . --file ./Dockerfile-testbed
```

#### Save and Load eclat testbed docker image

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
