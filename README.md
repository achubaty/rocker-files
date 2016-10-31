# rocker-files

Dockerfiles based on the [`rocker`](https://github.com/rocker-org/rocker) project by @eddelbuettel and @cboettig.

All of my images below are available from [Docker Hub](https://hub.docker.com/r/achubaty/) and can be pulled using:

```
docker pull achubaty/image-name
```

Specific use cases and instructions are in the `README` files for each image.

**Image**  | **Description** | **README** | **Image size**
-----------|-----------------|------------|---------------
[`r-spatial-base`](https://hub.docker.com/r/achubaty/r-spatial-base/) | Adds various R spatial/mapping tools to the [`rocker/r-base`](https://hub.docker.com/r/rocker/r-base/) container. | [README](https://github.com/achubaty/rocker-files/blob/master/r-spatial-base/README.md) | [![](https://images.microbadger.com/badges/image/achubaty/r-spatial-base.svg)](https://microbadger.com/images/achubaty/r-spatial-base)
[`r-spatial-devel`](https://hub.docker.com/r/achubaty/r-spatial-devel/) | Adds various R spatial/mapping tools to the [`rocker/drd`](https://hub.docker.com/r/rocker/drd/) container. | [README](https://github.com/achubaty/rocker-files/blob/master/r-spatial-devel/README.md) |[![](https://images.microbadger.com/badges/image/achubaty/r-spatial-devel.svg)](https://microbadger.com/images/achubaty/r-spatial-devel)
[`r-spades-devel`](https://hub.docker.com/r/achubaty/r-spades-devel/) | Provides a testing environment for building the [`SpaDES` package](https://github.com/PredictiveEcology/SpaDES). | [README](https://github.com/achubaty/rocker-files/blob/master/r-spades-devel/README.md) |[![](https://images.microbadger.com/badges/image/achubaty/r-spades-devel.svg)](https://microbadger.com/images/achubaty/r-spades-devel)
