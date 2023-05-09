FROM ubuntu:lunar-20230420 as builder

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		xz-utils

WORKDIR /opt
RUN curl https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.2.mpacbti-rel1/binrel/arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi.tar.xz --output arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi.tar.xz
RUN tar -xf arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi.tar.xz

FROM ubuntu:lunar-20230420 as runner
LABEL description="Linux container with a gcc-arm-eabi build environment."
LABEL version="1.3"

ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		git \
		make \
		cmake \
		cppcheck \
		ninja-build \
		python3-minimal \
		python3-docopt && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /opt
COPY --from=builder /opt/arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi /opt/arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi
ENV PATH "/opt/arm-gnu-toolchain-12.2.mpacbti-rel1-x86_64-arm-none-eabi/bin:$PATH"

WORKDIR /work
ADD . /work
