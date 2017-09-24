#!/usr/bin/env bash -
#title          :test.sh
#description    :launch the emulator to test a basic program converted to .tap
#author         :Franco Rondini (c) 2017
#date           :20170923
#version        :1.0.0  
#usage          :./test.sh
#notes          :       
#bash_version   :3.2.57(1)-release
#============================================================================
SRC_PATH=src/main/basic
TARGET_PATH=target/tapes

echo "basic source : ${SRC_PATH}/$1.bas"
echo "target tape  : ${TARGET_PATH}/$1.tap"

zmakebas -o ${TARGET_PATH}/$1.tap -n $1 ${SRC_PATH}/$1.bas
fuse --loading-sound --tape ${TARGET_PATH}/$1.tap
