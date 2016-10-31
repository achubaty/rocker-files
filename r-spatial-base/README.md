# rocker-files/r-spatial-base

Dockerfile based on the [`rocker`](https://github.com/rocker-org/rocker) project by @eddelbuettel and @cboettig.

`r-spatial-base` adds various R spatial/mapping tools to the [`rocker/r-base`](https://hub.docker.com/r/rocker/r-base/) container.

    - see [rocker issue 119](https://github.com/rocker-org/rocker/issues/119)

[![](https://images.microbadger.com/badges/image/achubaty/r-spatial-base.svg)](https://microbadger.com/images/achubaty/r-spatial-base)

## Using this image

Some spatial packages require an X server, so `R` should be started using:

```
docker run --rm -it achubaty/r-spatial-base bash

xvfb-run -a R
```

