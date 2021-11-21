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
docker run --rm -t -i --privileged -v $(pwd)/eclat-daemon:/opt/eclat-daemon eclat:latest  /sbin/my_init -- bash -l
```

On windows (replace c:\Users\Stefano\eclat-docker\ with your path)

```shell
docker run --rm -t -i --privileged -v c:\Users\Stefano\eclat-docker\eclat-daemon:/opt/eclat-daemon eclat:latest  /sbin/my_init -- bash -l
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
scripts/wsl-setup.sh
```

```shell
cd /opt/eclat-daemon
scripts/wsl-setup.sh
```



