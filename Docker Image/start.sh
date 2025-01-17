#!/bin/bash

REPO=$REPO
REG_TOKEN=$REG_TOKEN
NAME=$NAME

cd /home/docker || exit
./config.sh --url https://github.com/${REPO} --token ${REG_TOKEN} --name ${NAME}

./run.sh
