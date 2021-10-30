#!/bin/bash
#

loc=$(dirname $(readlink -f ${BASH_SOURCE[0]}))

WORD=${1:?"Base word required"}
LEN=${2:?"Length required"}

PROG="${loc}/anygram.py"
FILE="${loc}/wordlist"

if [ ! -f ${FILE} ];then
    echo "Cannot find word list"
    exit -1
fi

if [ ! -x ${PROG} ];then
    echo "Cannot find anygram python program"
    exit -1
fi

CMD="${PROG} ${WORD} ${LEN}"
if [ ${LEN} -lt 4 ];then
    #OUT=$(mktemp)
    ${CMD}|sort|uniq|awk '{printf "%s ",$1}'|fold -s
    echo
    #cat ${OUT}
    #rm ${OUT}
else
    ${CMD}|sort|comm -1 -2 ${FILE} -
fi

