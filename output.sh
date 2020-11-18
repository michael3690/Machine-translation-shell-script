#!/bin/sh

echo ""

echo "Source language is $SRCLANG"

echo "Target language is $TRGLANG"

if test "$TESTKEYWORDFILE" #checks if testkeyword selection used
then
    echo "Selection based on testkeywords used"
elif test "$VALKEYWORDFILE" #checks if valkeyword selection used
then
    echo "Selection based on validationkeywords used"
elif test "$RANDOM_LINES" == "1" #checks if random selection used
then
    echo "Random Selection used"
elif test "$LONGESTLINE" #checks if longest line selection used
then
    echo "Longest line selection used"
elif test "$SHORTESTLINE" #checks if shortest line selection used
then
    echo "Shortest line selection used"
else
    echo "No specific selection used"
fi

sh wordcount.sh #outputs wordcount of each file

sh linecount.sh #outputs linecount of each file
