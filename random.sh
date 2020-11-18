#!/bin/sh

#source language
cut -f 1 "$SRCLANG"-"$TRGLANG".csv > source #get source text on it's own

cat source | shuf -o source #randomise lines

head -$totallines source > testval"$SRCLANG" #file with just test and val lines

head -$TESTLINES testval"$SRCLANG" > test"$SRCLANG" #test file

tail -$VALLINES testval"$SRCLANG" > Validation"$SRCLANG" #validation file

let "totallines += 1" 
tail -n +"$totallines" source > train"$SRCLANG" #train file

rm testval"$SRCLANG" source #remove unnecessary files
let "totallines -= 1"

#target language
cut -f 2 "$SRCLANG"-"$TRGLANG".csv > target #get target text on it's own

cat target | shuf -o target #randomise lines

head -$totallines target > testval"$TRGLANG" #file with just test and val lines

head -$TESTLINES testval"$TRGLANG" > test"$TRGLANG" #test file

tail -$VALLINES testval"$TRGLANG" > Validation"$TRGLANG" #validation file

let "totallines += 1" 
tail -n +"$totallines" target > train"$TRGLANG" #train file

rm testval"$TRGLANG" target #remove unnecessary files
let "totallines -= 1"
