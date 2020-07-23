# achubaty/spades-project

Provides a development environment for [SpaDES](https://github.com/PredictiveEcology/SpaDES) projects.

[![](https://images.microbadger.com/badges/image/achubaty/spades-project.svg)](https://microbadger.com/images/achubaty/spades-project)

## Building the image

```bash
export GITHUB_PAT='your_pat_here'
docker build -t achubaty/spades-project --build-arg GITHUB_PAT=$GITHUB_PAT ~/GitHub/rocker-files/spades-project
```

## Using this image

Start the container instance:

```bash
# on macOS:
docker run -d -p 8080:8787 -e PASSWORD='yourpasswordhere' --name myProject achubaty/spades-project

# or, if on Ubuntu:
docker run -d -p 127.0.0.1:8080:8787 -e PASSWORD='yourpasswordhere' --name myProject achubaty/spades-project
```

Resume the container instance:

```bash
docker container start spades-project
```

Use browser to connect to the Rstudio instance inside the container instance.

Use username `rstudio` with your password.

```
localhost:8080
````

If you need to access `bash` inside the conainer instance (e.g., to install additional software), use `docker exec -it myProject bash`.

You can clone your project repo into the container and start developing!
