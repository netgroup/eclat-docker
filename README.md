# eclat-docker

## Setup script to clone the git repositories

scripts/setup.sh

On windows, after the execution of the container, run eclat-daemon/scripts/wsl-setup.sh from within the container (see below)

## Build docker Image

```shell
docker build -t eclat:latest .
```

## Create and execute container

```shell
docker run --rm -t -i --privileged --name eclat -v $(pwd)/eclat-daemon:/opt/eclat-daemon eclat:latest  /sbin/my_init -- bash -l
```

## Create and execute container on Windows

replace c:\Users\Stefano\eclat-docker\ with your path

```shell
docker run --rm -t -i --privileged --name eclat -v c:\Users\Stefano\eclat-docker\eclat-daemon:/opt/eclat-daemon eclat:latest  /sbin/my_init -- bash -l
```

execute a shell on a running container

```shell
docker exec -it eclat bash
```

## Copy your credentials

copy a file named github_rsa with your private key in /opt/eclat-daemon/scripts/temp_credentials

inside the container:

```shell
cd /opt/eclat-daemon
scripts/copy-credentials.sh
```

## Fix symbolic links in windows

inside the container:

```shell
cd /opt/eclat-daemon
scripts/setup-wsl.sh
```

## Build docker Image for Testbed

```shell
scripts/setup.sh
docker build -t eclat:testbed . --file ./Dockerfile-testbed
```

## Save and Load eclat testbed

```shell
docker save eclat:testbed | gzip > eclat.tar.gz
```

Scaricare l'immagine eclat.tar.gz

```shell
docker load < eclat.tar.gz
```

## Create and execute container

```shell
docker run --rm -t -i --privileged --name eclat eclat:testbed  /sbin/my_init -- bash -l 
```

## Execute testbed

```shell
cd /opt/eclat-daemon
python -m unittest test.test_parser
```
