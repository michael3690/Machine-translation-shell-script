#!/bin/sh

#source language
cut -f 1 "$SRCLANG"-"$TRGLANG".csv > source #get source text on it's own

awk '{ print length($0) " " $0; }' source | sort -n | cut -d ' ' -f 2- > shortsource

head -$totallines shortsource > testval"$SRCLANG" #adds shortest lines to test file

head -$TESTLINES testval"$SRCLANG" > test"$SRCLANG" #test file

tail -$VALLINES testval"$SRCLANG" > Validation"$SRCLANG" #validation file

let "totallines += 1"
tail -n +"$totallines" shortsource > train"$SRCLANG" #train file

rm testval"$SRCLANG" shortsource #remove unnecessary files
let "totallines -= 1"

#target language
cut -f 2 "$SRCLANG"-"$TRGLANG".csv > target #get target text on it's own

awk '{ print length($0) " " $0; }' target | sort -n | cut -d ' ' -f 2- > shorttarget

head -$totallines shorttarget > testval"$TRGLANG" #adds shortest lines to test file

head -$TESTLINES testval"$TRGLANG" > test"$TRGLANG" #test file

tail -$VALLINES testval"$TRGLANG" > Validation"$TRGLANG" #validation file

let "totallines += 1"
tail -n +"$totallines" shorttarget > train"$TRGLANG" #train file

rm testval"$TRGLANG" shorttarget #remove unnecessary files
let "totallines -= 1"
