# rocker-files

Dockerfiles based on the [`rocker`](https://github.com/rocker-org/rocker-versioned2) project by @eddelbuettel and @cboettig.

All of the images below are available from [Docker Hub](https://hub.docker.com/r/achubaty/) and can be pulled using:

```bash
docker pull achubaty/<image-name>:<tag>
```

## Package development and testing

Specific use cases and instructions are in the `README` files for each image.

**Image**  | **Description** |**Image size**
-----------|-----------------|--------------
[`r-spatial-base`](https://hub.docker.com/r/achubaty/r-spatial-base/) | Adds various R spatial/mapping tools to the [`rocker/r-base`](https://hub.docker.com/r/rocker/r-base/) container.<br />[README](https://github.com/achubaty/rocker-files/blob/master/r-spatial-base/README.md) | [![](https://images.microbadger.com/badges/image/achubaty/r-spatial-base.svg)](https://microbadger.com/images/achubaty/r-spatial-base)
[`r-spatial-devel`](https://hub.docker.com/r/achubaty/r-spatial-devel/) | Adds various R spatial/mapping tools to the [`rocker/drd`](https://hub.docker.com/r/rocker/drd/) container.<br />[README](https://github.com/achubaty/rocker-files/blob/master/r-spatial-devel/README.md) |[![](https://images.microbadger.com/badges/image/achubaty/r-spatial-devel.svg)](https://microbadger.com/images/achubaty/r-spatial-devel)



