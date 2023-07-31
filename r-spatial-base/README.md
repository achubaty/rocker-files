# rocker-files/r-spatial-base

Extends the `rocker/geospatial:ubuntugis` images from <https://github.com/rocker-org/rocker-versioned2>.

[![](https://images.microbadger.com/badges/image/achubaty/r-spatial-base.svg)](https://microbadger.com/images/achubaty/r-spatial-base)

## Using this image

```
docker run --rm -ti -e PASSWORD=yourpassword -p 8787:8787 achubaty/r-spatial-base:latest
```

In addition to `latest`, the following tags are also supported, which correspond to the R version used in the image:

- `4.3` (`latest`)
- `4.2`
- `4.1`
- `4.0`

