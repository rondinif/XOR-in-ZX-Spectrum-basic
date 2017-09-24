#!/usr/bin/env bash -
#title          :bas2tap.sh
#description    :compile .bat into .tap
#author         :Franco Rondini (c) 2017
#date           :20170923
#version        :1.0.0  
#usage          :./bas2tap.sh
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================
SRC_PATH=src/main/basic
TARGET_PATH=target/tapes

echo "basic source : ${SRC_PATH}/$1.bas"
echo "target tape  : ${TARGET_PATH}/$1.tap"

zmakebas -o ${TARGET_PATH}/$1.tap -n $1 ${SRC_PATH}/$1.bas

ls -lrt ${TARGET_PATH}/$1.tap