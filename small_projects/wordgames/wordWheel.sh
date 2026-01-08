#!/bin/bash
#

loc=$(dirname $(readlink -f ${BASH_SOURCE[0]}))

WORD=${1:?"Base word required"}
LETTER=${2:?"Key letter required"}
MINLEN=4

PROG="${loc}/anygram.py"
DICT="${loc}/wordWheel.dict"
LOCALE="en_GB"
PKG="hunspell"

chk=$(which ${PKG} 2>/dev/null)
if [ $? -ne 0 ]
then
    echo "${PKG} must be installed!"
    exit -1
fi

len=${#WORD}
if [ ${len} -lt ${MINLEN} ]
then
    echo "Target word must be at least ${MINLEN} characters!"
    exit -1
fi

for currlen in $(seq ${MINLEN} ${len})
do
    ${PROG} ${WORD} ${currlen} | awk "/.*${LETTER}.*/" | sort | uniq | ${PKG} -G -d ${LOCALE} -p ${DICT}
done