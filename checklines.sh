#!/bin/sh

lines=$(< ""$SRCLANG"-"$TRGLANG".csv" wc -l) #number of lines in downloaded src-trg file
if test "$totallines" -ge "$lines" #checks if test and val lines are bigger than total lines available
then
    echo "${red}Error: Test and Val lines exceed number of lines in total language file${norm}"
    trap "kill 0" EXIT #terminates script
fi
