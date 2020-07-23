# achubaty/landweb

Provides a development environment for [LandWeb](https://github.com/PredictiveEcology/LandWeb).

[![](https://images.microbadger.com/badges/image/achubaty/landweb.svg)](https://microbadger.com/images/achubaty/landweb)

## Building this image

```bash
export GITHUB_PAT='your_pat_here'
docker build -t achubaty/landweb --build-arg GITHUB_PAT=$GITHUB_PAT ~/GitHub/rocker-files/landweb
```

## Using this image

Start the container instance:

```bash
# on macOS:
docker run -d -p 8080:8787 -e PASSWORD='yourpasswordhere' -v /Users/achubaty/GitHub/LandWeb:/home/rstudio/GitHub/LandWeb --name LandWeb achubaty/landweb

# or, if on Ubuntu:
docker run -d -p 127.0.0.1:8080:8787 -e PASSWORD='yourpasswordhere' -v /home/achubaty/GitHub/LandWeb:/home/rstudio/GitHub/LandWeb --name LandWeb achubaty/landweb
```

Resume the container instance:

```bash
docker container start LandWeb
```

Use browser to connect to the Rstudio instance inside the container instance.

Use username `rstudio` with your password.

```
localhost:8080
````

If you need to access `bash` inside the conainer instance (e.g., to install additional software), use `docker exec -it LandWeb bash`.
