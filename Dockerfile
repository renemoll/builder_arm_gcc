FROM ubuntu:latest
LABEL description="Linux container with a gcc-arm-eabi build environment."
LABEL version="1.2"

ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		git \
		bzip2 \
		wget \
		make \
		cmake \
		ninja-build \
		python3-minimal \
		python3-docopt \
		libncurses5 \
		libpython2.7 && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN wget -qO - https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 | tar -xj
ENV PATH "/opt/gcc-arm-none-eabi-10.3-2021.10/bin:$PATH"

WORKDIR /work
ADD . /work
