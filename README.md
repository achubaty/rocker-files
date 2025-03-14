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

- `latest` (uses R 4.4.3)
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

- `latest` (uses R 4.4.3)
- `4.4.2` (uses R 4.4.2)
- `4.3.1` (uses R 4.3.1)
- `4.2.3` (uses R 4.2.3)
