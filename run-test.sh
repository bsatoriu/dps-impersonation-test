#!/bin/bash

basedir=$( cd "$(dirname "$0")" ; pwd -P)

OUTPUTDIR="${PWD}/output"
INPUT_FILE=$(ls -d input/*)

mkdir -p ${OUTPUTDIR}
echo "Testing writing output product"
python ${basedir}/test-output-product.py ${OUTPUTDIR}


echo "Testing opening input file"
python ${basedir}/test-input-file.py ${INPUT_FILE}
