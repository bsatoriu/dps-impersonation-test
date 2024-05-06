#!/bin/bash

basedir=$( cd "$(dirname "$0")" ; pwd -P)

OUTPUTDIR="${PWD}/output"
#INPUT_FILE=$(ls -d input/*)

printenv

echo "Installing maap-py..."

RUN mkdir /maap-py-alt \
    && git clone --single-branch --branch v3.1.5 https://github.com/MAAP-Project/maap-py.git /maap-py-alt/ \
    && pip install -e /maap-py-alt/

export MAAP_CONF=/maap-py-alt/

echo "Waiting 5 seconds..."
sleep 5

echo "Waiting 15 more seconds..."
python ${basedir}/wait.py

mkdir -p ${OUTPUTDIR}
echo "Testing writing output product"
python ${basedir}/test-output-product.py ${OUTPUTDIR}


#echo "Testing opening input file"
#python ${basedir}/test-input-file.py ${INPUT_FILE}
