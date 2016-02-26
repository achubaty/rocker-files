# rocker-files/r-spatial-base

Dockerfile based on the [`rocker`](https://github.com/rocker-org/rocker) project by @eddelbuettel and @cboettig.

* `r-spatial-base` adds various R spatial/mapping tools to the [`rocker/r-base`](https://registry.hub.docker.com/u/rocker/r-base/) container
    - see [rocker issue 119](https://github.com/rocker-org/rocker/issues/119)

* some spatial packages require an X server, so R should be started using:

    ```
    docker run --rm -it achubaty/r-spatial-base bash
    
    xvfb-run -a R
    ```
