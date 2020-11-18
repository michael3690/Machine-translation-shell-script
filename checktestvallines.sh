#!/bin/sh

if test "$TESTLINES" -eq " " #checks if test lines is set
then
   echo "${red}Error: test lines not set${norm}" 
   trap "kill 0" EXIT #terminates script
fi

if test "$VALLINES" -eq " " #checks if val lines is set
then
   echo "${red}Error: validation lines not set${norm}"
   trap "kill 0" EXIT #terminates script
fi
