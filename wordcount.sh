#!/bin/sh

echo "number of words in test"$SRCLANG" file:"
wc -w test"$SRCLANG"
echo "number of words in train"$SRCLANG" file:"
wc -w train"$SRCLANG"
echo "number of words in Validation"$SRCLANG" file:"
wc -w Validation"$SRCLANG"

echo "number of words in test"$TRGLANG" file:"
wc -w test"$TRGLANG"
echo "number of words in train"$TRGLANG" file:"
wc -w train"$TRGLANG"
echo "number of words in Validation"$TRGLANG" file:"
wc -w Validation"$TRGLANG"
