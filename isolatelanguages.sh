#!/bin/sh

echo "checking for selection method used...."

sh errors.sh

if test "$VALKEYWORDFILE" && test "$TESTKEYWORDFILE" #checks if valkeyword and testkeyword selection used
then
    sh testvalkeywords.sh
elif test "$TESTKEYWORDFILE" #checks if testkeyword selection used
then
    sh testkeywords.sh
elif test "$VALKEYWORDFILE" #checks if valkeyword selection used
then
    sh valkeywords.sh
elif test "$RANDOM_LINES" == "1" #checks if random selection used
then
    sh random.sh
elif test "$LONGESTLINE" == "1" #checks if longest line selection used
then
    sh longestline.sh
elif test "$SHORTESTLINE" == "1" #checks if shortest line selection used
then
    sh shortestline.sh
else
    #source language
    cut -f 1 "$SRCLANG"-"$TRGLANG".csv > source #get source text on it's own

    head -$totallines source > testval"$SRCLANG" #file with just test and val lines

    head -$TESTLINES testval"$SRCLANG" > test"$SRCLANG" #test file

    tail -$VALLINES testval"$SRCLANG" > Validation"$SRCLANG" #validation file

    let "totallines += 1" 
    tail -n +"$totallines" source > train"$SRCLANG" #train file

    rm testval"$SRCLANG" source #remove unnecessary files
    let "totallines -= 1"

    #target language
    cut -f 2 "$SRCLANG"-"$TRGLANG".csv > target #get target text on it's own

    head -$totallines target > testval"$TRGLANG" #file with just test and val lines

    head -$TESTLINES testval"$TRGLANG" > test"$TRGLANG" #test file

    tail -$VALLINES testval"$TRGLANG" > Validation"$TRGLANG" #validation file

    let "totallines += 1" 
    tail -n +"$totallines" target > train"$TRGLANG" #train file

    rm testval"$TRGLANG" target #remove unnecessary files
    let "totallines -= 1"
fi
