#!/bin/sh

#source language
cut -f 1 "$SRCLANG"-"$TRGLANG".csv > source #get source text on it's own

awk '{ print length($0) " " $0; }' source | sort -nr | cut -d ' ' -f 2- > longsource

head -$totallines longsource > testval"$SRCLANG" #adds longest lines to test file

head -$TESTLINES testval"$SRCLANG" > test"$SRCLANG" #test file

tail -$VALLINES testval"$SRCLANG" > Validation"$SRCLANG" #validation file

let "totallines += 1"
tail -n +"$totallines" longsource > train"$SRCLANG" #train file

rm testval"$SRCLANG" longsource #remove unnecessary files
let "totallines -= 1"

#target language
cut -f 2 "$SRCLANG"-"$TRGLANG".csv > target #get target text on it's own

awk '{ print length($0) " " $0; }' target | sort -n | cut -d ' ' -f 2- > longtarget

head -$totallines longtarget > testval"$TRGLANG" #adds longest lines to test file

head -$TESTLINES testval"$TRGLANG" > test"$TRGLANG" #test file

tail -$VALLINES testval"$TRGLANG" > Validation"$TRGLANG" #validation file

let "totallines += 1"
tail -n +"$totallines" longtarget > train"$TRGLANG" #train file

rm testval"$TRGLANG" longtarget #remove unnecessary files
let "totallines -= 1"
