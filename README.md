# rocker-files

Dockerfiles based on the [`rocker`](https://github.com/rocker-org/rocker-versioned2) project by @eddelbuettel and @cboettig.

All of the images below are available from [Docker Hub](https://hub.docker.com/r/achubaty/) and can be pulled using:

```bash
docker pull achubaty/<image-name>:<tag>
```

## Package development and testing

**Image**  | **Description** 
-----------|-----------------
[`r-spatial-base`](https://hub.docker.com/r/achubaty/r-spatial-base/) | Additional spatial/mapping tools to extend the `rocker/geospatial:ubuntugis` images.
[`r-spatial-devel`](https://hub.docker.com/r/achubaty/r-spatial-devel/) | Adds various R spatial/mapping tools to the `rocker/verse:devel` image per `rocker/geospatial:ubuntugis`.

The following tags are supported, which correspond to the major.minor R version used in the image:

- `latest` (uses R 4.5.0)
- `4.4` (uses R 4.4.3)
- `4.3` (uses R 4.3.3)
- `4.2` (uses R 4.2.3)
- `4.1` (uses R 4.1.3)
- `4.0` (uses R 4.0.5)

### Usage example

1. launch an instance of a container

```bash
docker run --rm -ti -e PASSWORD=yourpassword -p 8080:8787 achubaty/r-spatial-base:4.2
```

2. connect to the running container's Rstudio instance

Open your web browser and connect to `localhost:8080`, using username `rstudio` and the password you set in step 1 above.

## SpaDES projects

Generic Dockerfiles for building projects pinned to a specific version of R can be found in `dockerfiles/`.

- `spades-project_4.2.3` builds a generic image for R 4.2.3
- `spades-project_4.3.2` builds a generic image for R 4.3.2

**These generic dockerfiles are intended to be used to build project-specific images.**

### Building the base `spades-project` image

```bash
docker build . \
  -f ${HOME}/GitHub/rocker-files/dockerfiles/spades-project_4.3.2.Dockerfile \
  -t achubaty/spades-project:4.3.2
```

**Image**  | **Description** 
-----------|-----------------
[`spades-project`](https://hub.docker.com/r/achubaty/spades-project/) | Additional spatial/mapping tools to extend the `rocker/geospatial:ubuntugis` images for use with SpaDES projects.

The following tags are supported, which correspond to the major/minor R version used in the image:

- `latest` (uses R 4.5.0)
- `4.5.0` (uses R 4.5.0)
- `4.4.3` (uses R 4.4.3)
- `4.4.1` (uses R 4.4.1)
- `4.4.0` (uses R 4.4.0)
- `4.3.3` (uses R 4.3.3)
- `4.3.2` (uses R 4.3.2)
- `4.3.1` (uses R 4.3.1)
- `4.2.3` (uses R 4.2.3)

### Extending `spades-project` images

These images can be further extended to produce project-specific images with more advanced configuration options.

#### Example: LandWeb project

Latest Dockerfile: <https://github.com/PredictiveEcology/LandWeb/blob/development/docker/LandWeb-standalone.Dockerfile>

To clone specific project repositories from GitHub into the image we added:

- `GH_ORG` and `GH_REPO` to specify the GitHub organization (or user) and repository from which the project will be pulled into the image;
- `GH_TAG` specifies the git branch or tag to checkout;

Additionally, the following optional arguments can be specified:

- `USERNAME` specifies a specific username (default: `rstudio`);
- `USERID` and `GROUPID` specify the user and group ids, respectively, and can be specified to ensure user permissions of the container match those of the mounted volume (defaults: `1000`) (see <https://rocker-project.org/images/versioned/rstudio.html#userid-and-groupid>);

When launching an instance of the container, a custom `PASSWORD` can be specified and local input and output directories can be mounted.

##### Usage

1. build the `LandWeb-standalone` image

```bash
cd ~/GitHub/LandWeb

eval `ssh-agent -s`
ssh-add ~/.ssh/id_ed25519_GitHub ## use your ssh key

docker build . \
  --ssh default \
  --build-arg GH_ORG=PredictiveEcology \
  --build-arg GH_REPO=LandWeb \
  --build-arg GH_TAG=development \
  --build-arg USERID=$(id -u) \
  --build-arg GROUPID=$(id -g) \
  -f docker/LandWeb-standalone.Dockerfile \
  -t achubaty/landweb-standalone:development
```

2. launch an instance of the container:

```bash
RENV_PATHS_CACHE_CONTAINER=/renv/cache
RENV_PATHS_CACHE_HOST=/mnt/shared_cache/renv/cache

docker run -d -it \
  -e GITHUB_PAT=$(cat ${HOME}/.Renviron | grep GITHUB_PAT | cut -d '=' -f 2) \
  -e PASSWORD='MySecretPassword' \
  -e RENV_PATHS_CACHE=$RENV_PATHS_CACHE_CONTAINER \
  -v $RENV_PATHS_CACHE_HOST:$RENV_PATHS_CACHE_CONTAINER \
  --memory=128g \
  --cpus=32 \
  -p 127.0.0.1:8080:8787 \
  --mount type=bind,source=/mnt/projects/HRV/LandWeb/inputs,target=/home/rstudio/GitHub/LandWeb/inputs \
  --mount type=bind,source=/mnt/projects/HRV/LandWeb/inputs,target=/home/rstudio/GitHub/LandWeb/inputs \
  --name landweb01 \
  achubaty/landweb-standalone:development
```

3. connect to the running container's Rstudio instance

Open your web browser and connect to `localhost:8080`, using username `rstudio` and the password you set in step 2 above.

