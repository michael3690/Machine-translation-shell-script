#!/bin/sh

echo "number of lines in test"$SRCLANG" file:"
wc -l test"$SRCLANG"
echo "number of lines in train"$SRCLANG" file:"
wc -l train"$SRCLANG"
echo "number of lines in Validation"$SRCLANG" file:"
wc -l Validation"$SRCLANG"

echo "number of lines in test"$TRGLANG" file:"
wc -l test"$TRGLANG"
echo "number of lines in train"$TRGLANG" file:"
wc -l train"$TRGLANG"
echo "number of lines in Validation"$TRGLANG" file:"
wc -l Validation"$TRGLANG"
