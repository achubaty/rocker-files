# rocker-files/r-spades-devel

Dockerfile based on the [`rocker`](https://github.com/rocker-org/rocker) project by @eddelbuettel and @cboettig.

* `r-spades-devel` provides a testing environment for building the [`SpaDES` package](https://github.com/PredictiveEcology/SpaDES).

## `SpaDES` package checking

Start the container instance:

```
docker run --rm -it achubaty/r-spades-devel bash

xvfb-run -a Rdevel
```

Run the `SpaDES` package checks in `R-devel`:

```r
update.packages(ask = FALSE)
library(devtools)
system("cd SpaDES && git pull && cd ..")
session_info()
check("SpaDES", args = c('--as-cran'))
covr::package_coverage("SpaDES", quiet = FALSE)
```

Be sure to make a note of the Rdevel version and svn revision, and update `cran-comments.md` accordingly.
