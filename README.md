# TUI-docker

This is a repository that holds the configuration and build files needed run Apache Point Observatory's TUI software in a Docker container.

## Build Instructions

### MacOS Prerequisites

Install XQuartz (mandatory) and pulseaudio using Brew (optional, if you want sound).

Edit the file ```docker-compose.yml```. Uncomment the lines that terminate in ```#uncomment for MacOS``` and enter the IP address for your network interface card where indicated.

Example: if your network interface card's IP address is 192.168.3.5, the relevant lines of the ```docker-compose.yml``` file should look like:
```
    volumes:
      - /tmp/.X11-unix/:/tmp/.X11-unix                #uncomment for MacOS or Linux
      - ${HOME}/.config/pulse:/root/.config/pulse     #uncomment for MacOS or Linux
      - image-downloads:/root:rw
    environment:
      - DISPLAY=192.168.3.5:0      #uncomment for MacOS
      - PULSE_SERVER=192.168.3.5   #uncomment for MacOS
      #- DISPLAY=${DISPLAY}                            #uncomment for Linux
      #- PULSE_SERVER=10.3.0.1                         #uncomment for Linux
``` 

### Linux

Do not install Docker from your distribution's package repositories. Follow the [instructions documented on Docker's website](https://docs.docker.com/engine/) to install Docker.

Edit the file ```docker-compose.yml```. Uncomment the lines that terminate in ```#uncomment for Linux```. The rlevant lines should look as follows
```
    volumes:
      - /tmp/.X11-unix/:/tmp/.X11-unix                #uncomment for MacOS or Linux
      - ${HOME}/.config/pulse:/root/.config/pulse     #uncomment for MacOS or Linux
      - image-downloads:/root:rw
    environment:
      #- DISPLAY=<IP OF ETHERNET OR WIFI CARD>:0      #uncomment for MacOS
      #- PULSE_SERVER=<IP OF ETHERNET OR WIFI CARD>   #uncomment for MacOS
      - DISPLAY=${DISPLAY}                            #uncomment for Linux
      - PULSE_SERVER=10.3.0.1                         #uncomment for Linux
```

### All Platforms

Install either the Docker engine or Docker Desktop. ```cd``` to the directory to where this repository was cloned and using the CLI run

```
docker compose build
docker compose up
```

The first command will build the tui docker image using ```docker compose```, and the second will run a container using the built image using the parameters stored in ```docker-compose.yml```.


## Run Instructions

To run your docker container again, your new TUI container can be restarted from Docker Desktop or from the command line by doing ```docker start tui3```.

Alternatively, ```docker compose up``` can be run from the location of the ```docker-compose.yml``` file.
