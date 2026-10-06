#!/bin/env bash

loc=$(dirname $(readlink -f ${BASH_SOURCE[0]}))

dict=wordWheel.dict

sort -o ${dict} ${dict}

