# eclat-docker

## Submodule

```shell
$ git submodule update --init --recursive
```

## Build docker Image

```shell
$ docker build -t eclat:latest .
```

## Create and execute container

```shell
$ docker run --rm -t -i --privileged -v $(pwd)/eclat-daemon:/opt/eclat-daemon eclat:latest  /sbin/my_init -- bash -l
```

On windows (replace c:\Users\Stefano\eclat-docker\ with your path)

```shell
docker run --rm -t -i --privileged -v c:\Users\Stefano\eclat-docker\eclat-daemon:/opt/eclat-daemon eclat:latest  /sbin/my_init -- bash -l
```

