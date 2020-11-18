#!/bin/sh

#source language
cut -f 1 "$SRCLANG"-"$TRGLANG".csv > source #get source text on it's own

grep -i -w -h -f $VALKEYWORDFILE source | head -$VALLINES > Validation"$SRCLANG" #searches for keywords from val_keywords.txt in source language text and puts lines found in Validation file

grep -i -w -h -f $TESTKEYWORDFILE source | head -$TESTLINES > test"$SRCLANG" #searches for keywords from test_keywords.txt in source language text and puts lines found in test file

grep -v -f Validation"$SRCLANG" source > testtrain"$SRCLANG" #removes lines in validation from full source file

grep -v -f test"$SRCLANG" testtrain"$SRCLANG" > train"$SRCLANG" #removes lines in test from full source file

rm testtrain"$SRCLANG" source #removes unnecessary files

#target language
cut -f 2 "$SRCLANG"-"$TRGLANG".csv > target #get source text on it's own

grep -i -w -h -f $VALKEYWORDFILE target | head -$VALLINES > Validation"$TRGLANG" #searches for keywords from val_keywords.txt in target language text and puts lines found in Validation file

grep -i -w -h -f $TESTKEYWORDFILE target | head -$TESTLINES > test"$TRGLANG" #searches for keywords from test_keywords.txt in target language text and puts lines found in test file

grep -v -f Validation"$TRGLANG" target > testtrain"$TRGLANG" #removes lines in validation from full source file

grep -v -f test"$TRGLANG" testtrain"$TRGLANG" > train"$TRGLANG" #removes lines in test from full source file

rm testtrain"$TRGLANG" target #removes unnecessary files

#potential errors
if wc -l test"$SRCLANG" -lt "$TESTLINES" #checks if test file is below requested number of lines
then
    echo "Warning: source test file is below requested number of lines"
fi

if wc -l test"$TRGLANG" -lt "$TESTLINES" #checks if test file is below requested number of lines
then
    echo "Warning: target test file is below requested number of lines"
fi

if wc -l Validation"$SRCLANG" -lt "$VALLINES" #checks if Validation file is below requested number of lines
then
    echo "Warning: source test file is below requested number of lines"
fi

if wc -l Validation"$TRGLANG" -lt "$VALLINES" #checks if Validation file is below requested number of lines
then
    echo "Warning: target test file is below requested number of lines"
fi

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

sourcevalwordcount=$(wc -l < Validation"$SRCLANG")
targetvalwordcount=$(wc -l < Validation"$TRGLANG")
if [ "$sourcevalwordcount" -lt "$VALLINES" ] #checks if Validation file is below requested number of lines
then
    echo "${red}Warning: source Validation file is below requested number of lines${norm}"
fi

if [ "$targetvalwordcount" -lt "$VALLINES" ] #checks if Validation file is below requested number of lines
then
    echo "${red}Warning: target Validation file is below requested number of lines${norm}"
fi
