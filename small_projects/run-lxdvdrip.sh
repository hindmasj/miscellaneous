#!/bin/bash

OUT_DIR=${HOME}/Videos/DVDS
MED_DIR=/var/run/media/${USER}
SFX=mp4
FILM_DIR=/tmp/film-dvd

NAME=${1:?"You need to supply a DVD title"}
if [ -b ${NAME} ];
then
    INPUT=${NAME}
else
    INPUT=${MED_DIR}/${NAME}
fi

ONAME=${2:-${NAME}}
OUTPUT="${OUT_DIR}/${ONAME}.${SFX}"

rm -rf ${FILM_DIR}

lxdvdrip -lang=en -a=2 -vp=off -wb=0 \
	 -dl="${INPUT}" -file="${OUTPUT}"

ls -lh "${OUTPUT}"
file "${OUTPUT}"
df -h ${OUT_DIR}
