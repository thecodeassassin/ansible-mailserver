#!/bin/bash

GLEXEC=$(which ansible-galaxy)

if [ $? = 1 ]; then
  echo
  echo "ansible-galaxy not found, please make sure you have ansible 1.9+ installed."
  echo
  exit
fi

$GLEXEC install -f -r requirements.txt
