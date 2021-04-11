# Cloud Genetics default container image
> Krishna Kumar

[![License](https://img.shields.io/badge/license-CC--By--SA--4.0-brightgreen.svg)](https://raw.githubusercontent.com/cloudgenetics/container/main/LICENSE.md)
[![Docker Repository on Quay](https://quay.io/repository/cloudgenetics/cgcompute/status "Docker Repository on Quay")](https://quay.io/repository/cloudgenetics/cgcompute)

# Using the docker image
* The docker image can be used directly from Quay.io
* Pull the docker image `docker pull quay.io/cloudgenetics/compute`
* To launch the `cloudgenetics/compute`  docker container, run `docker run -ti quay.io/cloudgenetics/compute:latest /bin/bash`

# To login as root
* Launching docker as root user: `docker exec -u 0 -ti <containerid> /bin/bash`

# Creating an image from the docker file
* To build an image from docker file run as root `docker build -t "cloudgenetics/compute" /path/to/Dockerfile`
* `docker history` will show you the effect of each command has on the overall size of the file.

