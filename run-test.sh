#!/bin/bash

basedir=$( cd "$(dirname "$0")" ; pwd -P)

OUTPUTDIR="${PWD}/output"
#INPUT_FILE=$(ls -d input/*)

printenv

export MAAP_CONF=/maap-py/

echo "Waiting 5 seconds..."
sleep 5

echo "Waiting 15 more seconds..."
python ${basedir}/wait.py

mkdir -p ${OUTPUTDIR}
echo "Testing writing output product"
python ${basedir}/test-output-product.py ${OUTPUTDIR}


#echo "Testing opening input file"
#python ${basedir}/test-input-file.py ${INPUT_FILE}
