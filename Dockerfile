# syntax=docker/dockerfile:1

FROM ubuntu:22.04
SHELL ["/bin/bash", "-c"]
WORKDIR /workdir
## Set timezone
RUN ln -snf /usr/share/zoneinfo/UTC /etc/localtime && echo UTC > /etc/timezone

## Later get the APO scripts moved here.
#COPY python/TuiScripts python/TUIAdditions/Scripts
## Get Dependencies.
RUN apt-get update -y && 					\
	apt-get install python3 python3-pip python3-tk 		\
		xpa-tools saods9 wget git 			\
		alsa-base alsa-utils libsndfile1-dev pulseaudio \
		-y --no-install-recommends
RUN apt-get clean
RUN pip3 install numpy scipy Pillow matplotlib astropy pygame
RUN git clone -b 'v3.1.1beta0' https://github.com/ApachePointObservatory/TUI3.git python/TUI3

CMD ["python3", "python/TUI3/runtui.py"]
