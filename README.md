# Docker image for ARM

A docker image with the arm-none-eabi-gcc toolchain (version 12.2-2023.03) installed.

## How to use

The machine features a `/work/` folder to mount your local volume on.

To enter the machine, open a shell in you project folder an execute (Powershell):
> docker run --rm -it -v ${PWD}:/work/ renemoll/builder_arm_gcc:latest /bin/bash

## How to build the image

* Checkout this repository
* Execute the following command:
> docker build -t renemoll/builder_arm_gcc .
