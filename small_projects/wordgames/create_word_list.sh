#!/usr/bin/bash

DIR='/usr/lib64/aspell-0.60'
COM=en-common.rws
TMP=$(mktemp)
OUT=wordlist

strings ${DIR}/${COM} | awk '/[a-z]+/ {print $1}' | grep -v "'" > ${TMP}
for f in ${DIR}/en_GB*.rws
do
    strings ${f} | awk '/[a-z]+/ {print $1}' | grep -v "'" >> ${TMP}
done

sort ${TMP} | uniq > ${OUT}
rm ${TMP}
