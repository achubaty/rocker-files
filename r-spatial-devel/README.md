# rocker-files/r-spatial-devel

Dockerfile based on the [`rocker`](https://github.com/rocker-org/rocker) project by @eddelbuettel and @cboettig.

`r-spatial-devel` adds various R spatial/mapping tools to the [`rocker/drd`](https://hub.docker.com/r/rocker/drd/) container, which contains the most recent R-devel.
See [rocker issue 119](https://github.com/rocker-org/rocker/issues/119).

[![](https://images.microbadger.com/badges/image/achubaty/r-spatial-devel.svg)](https://microbadger.com/images/achubaty/r-spatial-devel)

## Using this image

Some spatial packages require an X server, so `Rdevel` should be started using:

```
docker run --rm -it achubaty/r-spatial-devel bash

xvfb-run -a Rdevel
```

