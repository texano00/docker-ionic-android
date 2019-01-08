# Docker image with Ionic and Android SDK

[![Docker Build Status](https://img.shields.io/docker/build/texano00/ionic-android.svg)](https://hub.docker.com/r/texano00/ionic-android/)

[![Docker Pulls](https://img.shields.io/docker/pulls/texano00/ionic-android.svg)](https://hub.docker.com/r/texano00/ionic-android/)

## Why

I've prepared this docker image in order to build a continuous integration for an Ionic project.
Thanks to this image, every time i add a feature that has to be tested, i've automated the build of the apk and the delivery to internal testers.


## Usage

```bash
cd myApp

sudo docker run -it --entrypoint /bin/bash --rm -v $(pwd):/ionicapp texano00:ionic-android

ionic cordova build android
```

## Image

The docker image is based on ubuntu:bionic and include:

- Linux tools
- Open jdk
- Gradle
- Node npm
- Ionic
- Android sdk
  - platform-tools
  - build-tools
