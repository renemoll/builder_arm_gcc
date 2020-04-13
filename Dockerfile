FROM ubuntu:19.10
LABEL description="Builder for bare metal ARM."
LABEL version="1.1"

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		git \
		bzip2 \
		wget \
		make \
		cmake \
		python3-minimal \
		python3-docopt && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN wget -qO - https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 | tar -xj
ENV PATH "/opt/gcc-arm-none-eabi-9-2019-q4-major/bin:$PATH"

WORKDIR /work
ADD . /work
