#!/bin/bash

basedir=$( cd "$(dirname "$0")" ; pwd -P)

OUTPUTDIR="${PWD}/output"
#INPUT_FILE=$(ls -d input/*)

printenv

echo "pwd"
echo $(pwd)

echo "whoami"
echo $(whoami)

echo "cd ~/ && pwd && ls -a"
echo $(cd ~/ && pwd && ls -a)

echo "ls -a /home/"
echo $(ls -a /home/)

echo "cat ~/.aws/config"
echo $(cat ~/.aws/config)

echo "AWS_CONFIG_FILE"
echo $AWS_CONFIG_FILE

echo "Waiting 15 seconds..."
sleep 15

echo "Waiting 15 more seconds..."
python ${basedir}/wait.py

mkdir -p ${OUTPUTDIR}
echo "Testing writing output product"
python ${basedir}/test-output-product.py ${OUTPUTDIR}


#echo "Testing opening input file"
#python ${basedir}/test-input-file.py ${INPUT_FILE}
