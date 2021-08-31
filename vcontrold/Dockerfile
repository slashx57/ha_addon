#ARG BUILD_FROM
#FROM $BUILD_FROM
#FROM alpine:latest
#FROM homeassistant/amd64-homeassistant-base:4.0
#FROM debian:stable-slim
FROM hassioaddons/debian-base:latest

# Add env
ENV LANG C.UTF-8

#COPY src /usr/src/.

WORKDIR /usr/src

COPY /data/build.sh /usr/src/
RUN /usr/src/build.sh

COPY /data/run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
