#!/bin/sh

set -o errexit
set -o nounset

DIR=$(dirname $(readlink -f ${0}))
mkdir -p ${DIR}/output 2>/dev/null || :

LINE_COUNT=$(wc --lines < ${1})
CHUNKS=$(( (LINE_COUNT/1000) ))
START=1
# for every chunk except last
for (( i=1; i < CHUNKS; i+=1 ))
do
  sed -n "${START},+1000p" ${1} | sed --file=${DIR}/tojsonarray.sed - > ${DIR}/output/${i}.json
  START=$((START+1000))
done

# final chunk may be larger to fit the remainder
sed -n "${START},+2000p" ${1} | sed --file=${DIR}/tojsonarray.sed - > ${DIR}/output/${CHUNKS}.json
