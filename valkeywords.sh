#!/bin/sh

#source language
cut -f 1 "$SRCLANG"-"$TRGLANG".csv > source #get source text on it's own

grep -i -w -h -f $VALKEYWORDFILE source | head -$VALLINES > Validation"$SRCLANG" #searches for keywords from val_keywords.txt in source language text and puts lines found in Validation file

grep -v -f Validation"$SRCLANG" source > testtrain"$SRCLANG" #removes lines in validation from full source file

head -$TESTLINES testtrain"$SRCLANG" > test"$SRCLANG" #test file

let "TESTLINES += 1" 
tail -n +"$TESTLINES" testtrain"$SRCLANG" > train"$SRCLANG" #train file

rm testtrain"$SRCLANG" source #removes unnecessary files
let "TESTLINES -= 1" 

#target language
cut -f 2 "$SRCLANG"-"$TRGLANG".csv > target #get target text on it's own

grep -i -w -h -f $VALKEYWORDFILE target | head -$VALLINES > Validation"$TRGLANG" #searches for keywords from val_keywords.txt in target language text and puts lines found in Validation file

grep -v -f Validation"$TRGLANG" target > testtrain"$TRGLANG" #removes lines in validation from full target file

head -$TESTLINES testtrain"$TRGLANG" > test"$TRGLANG" #test file

let "TESTLINES += 1" 
tail -n +"$TESTLINES" testtrain"$TRGLANG" > train"$TRGLANG" #train file

rm testtrain"$TRGLANG" target #removes unnecessary files
let "TESTLINES -= 1"

sourcewordcount=$(wc -l < Validation"$SRCLANG")
targetwordcount=$(wc -l < Validation"$TRGLANG")
if [ "$sourcewordcount" -lt "$VALLINES" ] #checks if Validation file is below requested number of lines
then
    echo "${red}Warning: source Validation file is below requested number of lines${norm}"
fi

if [ "$targetwordcount" -lt "$VALLINES" ] #checks if Validation file is below requested number of lines
then
    echo "${red}Warning: target Validation file is below requested number of lines${norm}"
fi
