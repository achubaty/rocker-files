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

The following tags are supported, which correspond to the major/minor R version used in the image:

- `latest` (uses R 4.3.1)
- `4.3` (uses R 4.3.1)
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
- `spades-project_4.3.1` builds a generic image for R 4.3.1

**These generic dockerfiles are intended to be used to build project-specific images.**

### Building the base `spades-project` image

```bash
docker build . \
  -f ${HOME}/GitHub/rocker-files/dockerfiles/spades-project_4.2.3.Dockerfile \
  -t achubaty/spades-project:4.2.3
```

**Image**  | **Description** |**Image size**
-----------|-----------------|--------------
[`r-spatial-base`](https://hub.docker.com/r/achubaty/r-spatial-base/) | Adds various R spatial/mapping tools to the `rocker/geospatial:ubuntugis` container.<br />[README](https://github.com/achubaty/rocker-files/blob/master/r-spatial-base/README.md) | [![](https://images.microbadger.com/badges/image/achubaty/r-spatial-base.svg)](https://microbadger.com/images/achubaty/r-spatial-base)
[`r-spatial-devel`](https://hub.docker.com/r/achubaty/r-spatial-devel/) | Adds various R spatial/mapping tools to the `rocker/verse:devel` container.<br />[README](https://github.com/achubaty/rocker-files/blob/master/r-spatial-devel/README.md) |[![](https://images.microbadger.com/badges/image/achubaty/r-spatial-devel.svg)](https://microbadger.com/images/achubaty/r-spatial-devel)



