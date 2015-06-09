# rocker-files/r-spatial-devel

Dockerfile based on the [`rocker`](https://github.com/rocker-org/rocker) project by @eddelbuettel and @cboettig.

* `r-spatial-devel` adds various R spatial/mapping tools to the [`rocker/r-devel`](https://registry.hub.docker.com/u/rocker/r-devel/) container
    - see [rocker issue 119](https://github.com/rocker-org/rocker/issues/119)

* some spatial packages require an X server, so Rdevel should be started using:

    ```
    docker run --rm -it achubaty/r-spatial-devel bash

    xvfb-run Rdevel
    ```
