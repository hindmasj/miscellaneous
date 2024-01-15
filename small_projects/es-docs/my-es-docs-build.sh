#!/bin/bash

LOC=$(dirname $(readlink -f ${BASH_SOURCE[0]}))

ES_DOC=${PWD}/elasticsearch-docs
ES_SRC=${PWD}/elasticsearch
OUT_MAIN=${PWD}/elasticsearch_html

ES_GITHUB="https://github.com/elastic/"

if [ ! -d ${ES_DOC} ]
then
 git clone ${ES_GITHUB}/docs.git
 mv docs elasticsearch-docs
fi

if [ ! -d ${ES_SRC} ]
then
 git clone  https://github.com/elastic/elasticsearch.git
fi

mkdir -p ${OUT_MAIN}

#- https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html[Elasticsearch Guide]
#- https://www.elastic.co/guide/en/elasticsearch/painless/current/index.html[Painless Scripting Language]
#- https://www.elastic.co/guide/en/elasticsearch/plugins/current/index.html[Elasticsearch Plugins and Integrations]
#- https://www.elastic.co/guide/en/elasticsearch/resiliency/current/index.html[Elasticsearch Resiliency Status]

elasticsearch_docs="reference painless plugins resiliency"

builder=${ES_DOC}/build_docs

for docset in ${elasticsearch_docs}
do
 echo ${docset}
 input=${ES_SRC}/docs/${docset}/index.asciidoc
 output=${OUT_MAIN}/${docset}
 ${builder} --doc ${input} --out ${output}
done
