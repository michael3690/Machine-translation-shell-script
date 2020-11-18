#!/bin/sh

#source language
cut -f 1 "$SRCLANG"-"$TRGLANG".csv > source #get source text on it's own

grep -i -w -h -f $TESTKEYWORDFILE source | head -$TESTLINES > test"$SRCLANG" #searches for keywords from test_keywords.txt in source language text and puts lines found in test file

grep -v -f test"$SRCLANG" source > trainval"$SRCLANG" #removes lines in test from full source language file

head -$VALLINES trainval"$SRCLANG" > Validation"$SRCLANG" #validation file

let "VALLINES += 1" 
tail -n +"$VALLINES" trainval"$SRCLANG" > train"$SRCLANG" #train file

rm trainval"$SRCLANG" source #removes unnecessary files
let "TESTLINES -= 1" 

#target language
cut -f 2 "$SRCLANG"-"$TRGLANG".csv > target #get target text on it's own

grep -i -w -h -f $TESTKEYWORDFILE target | head -$TESTLINES > test"$TRGLANG" #searches for keywords from test_keywords.txt in target language text and puts lines found in test file

grep -v -f test"$TRGLANG" target > trainval"$TRGLANG" #removes lines in test from full target language file

head -$VALLINES trainval"$TRGLANG" > Validation"$TRGLANG" #validation file

let "VALLINES += 1" 
tail -n +"$VALLINES" trainval"$TRGLANG" > train"$TRGLANG" #train file

rm trainval"$TRGLANG" target #removes unnecessary files
let "TESTLINES -= 1" 

sourcewordcount=$(wc -l < test"$SRCLANG")
targetwordcount=$(wc -l < test"$TRGLANG")
if [ "$sourcewordcount" -lt "$TESTLINES" ] #checks if test file is below requested number of lines
then
    echo "${red}Warning: source test file is below requested number of lines${norm}"
fi

if [ "$targetwordcount" -lt "$TESTLINES" ] #checks if test file is below requested number of lines
then
    echo "${red}Warning: target test file is below requested number of lines${norm}"
fi
