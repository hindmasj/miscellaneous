#!/bin/bash

LOC=$(dirname $(readlink -f ${BASH_SOURCE[0]}))

STEM="scan_2"
FILE=${LOC}/${STEM}.txt
date '+%Y%m%d%H%M%S' > $FILE

for host in $(grep report ${LOC}/scan_1.txt | awk '{print $5}')
do
    HOSTS="${HOSTS} ${host}"
done

for scan in "PS" "sS" "sU"
do
    CMD="nmap -${scan} ${HOSTS}"
    sudo $CMD -oX ${STEM}_${scan}.xml >> ${FILE}
done
