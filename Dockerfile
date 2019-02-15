FROM ubuntu:bionic

LABEL MAINTAINER="Yuri Bacciarini <yuribacciarini@gmail.com>"

ARG NODEJS_VERSION="8"
ARG IONIC_VERSION="4.3.1"
ARG ANDROID_SDK_VERSION="4333796"
ARG ANDROID_HOME="/opt/android-sdk"
ARG ANDROID_BUILD_TOOLS_VERSION="26.0.2"
ENV ANDROID_HOME "${ANDROID_HOME}"

RUN apt-get update \
    && apt-get install -y apt-utils

RUN apt-get install -y build-essential

RUN apt-get install -y openjdk-8-jdk

RUN apt-get install -y curl \
       unzip \
       git \
       gradle 

RUN apt-get install -y nodejs  npm \
    && npm install -g cordova ionic@${IONIC_VERSION} 

RUN cd /tmp 

RUN curl -fSLk https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_VERSION}.zip -o sdk-tools-linux-${ANDROID_SDK_VERSION}.zip

RUN mkdir ~/.android \
    && touch ~/.android/repositories.cfg \
    && unzip sdk-tools-linux-${ANDROID_SDK_VERSION}.zip \
    && mkdir /opt/android-sdk \
    && mv tools /opt/android-sdk

RUN (while sleep 3; do echo "y"; done) | $ANDROID_HOME/tools/bin/sdkmanager --licenses \
    && $ANDROID_HOME/tools/bin/sdkmanager "platform-tools" \
    && $ANDROID_HOME/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    && apt-get autoremove -y \
    && rm -rf /tmp/sdk-tools-linux-${ANDROID_SDK_VERSION}.zip \ 
    && mkdir /ionicapp

RUN curl -sL https://sentry.io/get-cli/ | bash

RUN npm install xml2json util

WORKDIR /ionicapp

