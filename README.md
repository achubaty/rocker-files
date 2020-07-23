# rocker-files

Dockerfiles based on the [`rocker`](https://github.com/rocker-org/rocker) project by @eddelbuettel and @cboettig.

All of my images below are available from [Docker Hub](https://hub.docker.com/r/achubaty/) and can be pulled using:

```bash
docker pull achubaty/<image-name>
```

Specific use cases and instructions are in the `README` files for each image.

## SpaDES projects

**Image**  | **Description** |**Image size**
-----------|-----------------|--------------
[`landweb`](https://hub.docker.com/r/achubaty/landweb/) | LandWeb development environment.<br />[README](https://github.com/achubaty/rocker-files/blob/master/landweb/README.md) | [![](https://images.microbadger.com/badges/image/achubaty/landweb.svg)](https://microbadger.com/images/achubaty/landweb)
[`landweb-standalone`](https://hub.docker.com/r/achubaty/landweb-standalone/) | A self-contained version of LandWeb development environment.<br />[README](https://github.com/achubaty/rocker-files/blob/master/landweb-standalone/README.md) | [![](https://images.microbadger.com/badges/image/achubaty/landweb-standalone.svg)](https://microbadger.com/images/achubaty/landweb-standalone)
[`spades-project`](https://hub.docker.com/r/achubaty/spades-project/) | Generic SpaDES project development environment.<br />[README](https://github.com/achubaty/rocker-files/blob/master/spades-project/README.md) | [![](https://images.microbadger.com/badges/image/achubaty/spades-project.svg)](https://microbadger.com/images/achubaty/spades-project)


## Package development and testing

**Image**  | **Description** |**Image size**
-----------|-----------------|--------------
[`r-spatial-base`](https://hub.docker.com/r/achubaty/r-spatial-base/) | Adds various R spatial/mapping tools to the [`rocker/r-base`](https://hub.docker.com/r/rocker/r-base/) container.<br />[README](https://github.com/achubaty/rocker-files/blob/master/r-spatial-base/README.md) | [![](https://images.microbadger.com/badges/image/achubaty/r-spatial-base.svg)](https://microbadger.com/images/achubaty/r-spatial-base)
[`r-spatial-devel`](https://hub.docker.com/r/achubaty/r-spatial-devel/) | Adds various R spatial/mapping tools to the [`rocker/drd`](https://hub.docker.com/r/rocker/drd/) container.<br />[README](https://github.com/achubaty/rocker-files/blob/master/r-spatial-devel/README.md) |[![](https://images.microbadger.com/badges/image/achubaty/r-spatial-devel.svg)](https://microbadger.com/images/achubaty/r-spatial-devel)
[`r-spades-devel`](https://hub.docker.com/r/achubaty/r-spades-devel/) | Provides a testing environment for building the [`SpaDES` package](https://github.com/PredictiveEcology/SpaDES).<br />[README](https://github.com/achubaty/rocker-files/blob/master/r-spades-devel/README.md) |[![](https://images.microbadger.com/badges/image/achubaty/r-spades-devel.svg)](https://microbadger.com/images/achubaty/r-spades-devel)
