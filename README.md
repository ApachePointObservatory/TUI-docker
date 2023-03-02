# TUI-docker

This is a repository that holds the configuration and build files needed run Apache Point Observatory's TUI software in a Docker container.

## Build Instructions

Install either the Docker engine or Docker Desktop. ```cd``` to the directory to where this repository was cloned and using the CLI run

```
docker compose build
docker compose up
```

The first command will build the tui docker image using ```docker compose```, and the second will run a container using the built image using the parameters stored in ```docker-compose.yml```.


## Run Instructions

To run your docker container again, your new TUI container can be restarted from Docker Desktop or from the command line by doing ```docker start tui3```.

Alternatively, ```docker compose up``` can be run from the location of the ```docker-compose.yml``` file.
