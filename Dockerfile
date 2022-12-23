ARG UBUNTU_VERSION=20.04

FROM ubuntu:${UBUNTU_VERSION}

ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -f -y \
    make \
    texlive-xetex \
    texlive-fonts-extra \
    fonts-font-awesome \
    git

RUN mkdir -p /resume

WORKDIR /resume
