#!/bin/bash

ROOTGIT=$(git rev-parse --show-toplevel)
SOURCENEO="${ROOTGIT}/neofrag/html"
SOURCEDOCKER="${ROOTGIT}/neofrag/docker"
HOSTNAME=neo
DOCKER_IMAGE_NAME=neo
DOCKER_CMD="$(which docker)"
if [ -z "${DOCKER_CMD}" ]
then
  echo "docker is missing" >&2
  echo "INFO: run apt install docker" >&2
  exit 1
fi

${DOCKER_CMD} stop neo > /dev/null 2>&1

${DOCKER_CMD} run \
  --rm -d \
  --name ${DOCKER_IMAGE_NAME} \
  -it -h ${HOSTNAME} \
  --network host \
  -v "${HOME}:/home/neo" \
  -v "${SOURCEDOCKER}:/var/docker" \
  -v "${SOURCENEO}:/var/www/html" \
  -v /tmp:/tmp  \
  ${DOCKER_IMAGE_NAME}
# /var/docker/prog.sh 
   

#${DOCKER_CMD} exec -it neo /var/docker/prog.sh "${SHELL}" 
#${DOCKER_CMD} exec -e COLUMNS="${COLUMNS}" -e LINES="${LINES}" -e TERM=$TERM -it neo ${SHELL}
${DOCKER_CMD} exec -e COLUMNS="${COLUMNS}" -e LINES="${LINES}" -e TERM=$TERM -it neo /var/docker/prog.sh "${SHELL}"

echo "Stopping QA Tools Docker image"                                                                                                  
${DOCKER_CMD} stop neo > /dev/null 2>&1 &
