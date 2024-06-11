#!/usr/bin/env bash

CLONE=${1}

if [ -z "${CLONE}" ]
then
    echo "You need to specify a source directory"
    exit 1
fi

if [ ! -d "${CLONE}" ]
then
    echo "Source directory ${CLONE} is not a directory"
    exit 2
fi

if [ ! -f "${CLONE}/pom.xml" ]
then
    echo "No pom file found in ${CLONE}"
    exit 3
fi

IMAGE=maven:latest
docker pull ${IMAGE}

CLONE=$(readlink -f ${CLONE})
NAME=$(basename ${CLONE})

shift
COMMAND=${@}
if [ -z "${COMMAND}" ]
then
    COMMAND="mvn test install"
fi

docker run -it --rm \
    -v "${CLONE}":/usr/src/mymaven \
    -v "${HOME}/.m2":/root/.m2 \
    -w /usr/src/mymaven \
    --name "maven-builder-${NAME}" \
    ${IMAGE} \
    ${COMMAND}

