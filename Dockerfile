# syntax=docker/dockerfile:1

FROM ubuntu:22.04
SHELL ["/bin/bash", "-c"]
WORKDIR /workdir
## Set timezone
RUN ln -snf /usr/share/zoneinfo/UTC /etc/localtime && echo UTC > /etc/timezone

## Get Dependencies.
RUN apt-get update -y && 					\
	apt-get install python3 python3-pip python3-tk 		\
		xpa-tools saods9 wget git 			\
		alsa-base alsa-utils libsndfile1-dev pulseaudio \
		-y --no-install-recommends &&			\
	apt-get clean
RUN pip3 install numpy Pillow matplotlib astropy pygame twisted
RUN git clone -b 'v3.1.4twistedfix' --recurse-submodules https://github.com/ApachePointObservatory/TUI3.git python/TUI3
## Later get the APO scripts moved here using a git clone.

CMD ["python3", "python/TUI3/runtui.py"]
