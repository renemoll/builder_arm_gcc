# Docker image for ARM

A docker image with the arm-none-eabi-gcc toolchain (version 2019-q4) installed.

## How to use

The machine features a `/work/` folder to mount your local volume on.

To enter the machine, open a shell in you project folder an execute (Powershell):
> docker run --rm -it -v ${PWD}:/work/ renemoll/builder_arm_gcc:latest /bin/bash
