#!/bin/bash

PROGRAM_DIR="$(realpath "$(dirname "$0")")"
DOCKER_IMAGE_NAME=neo
DOCKER_CMD="$(which docker)"
if [ -z "${DOCKER_CMD}" ]
then
  echo "docker is missing" >&2
  echo "INFO: run apt install docker" >&2
  exit 1
fi

${DOCKER_CMD} build -f "${PROGRAM_DIR}/neo.dockerfile" -t "${DOCKER_IMAGE_NAME}" "${PROGRAM_DIR}" 
