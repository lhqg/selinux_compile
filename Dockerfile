# syntax=docker/dockerfile:1
# see https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG DISTRO=ubuntu
ARG DISTRO_VERS=latest
ARG PLATFORM=amd64

FROM --platform=linux/${PLATFORM} ${DISTRO}:${DISTRO_VERS}

COPY ./script.sh ./
RUN chmod u+x ./script.sh

# Script to execute when the docker container starts up
ENTRYPOINT ["./script.sh"]
