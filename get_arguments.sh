#!/bin/sh

HELP=0

for ARG in $@
do
    shift
    OPT=$( echo $ARG | cut -d "=" -f 2 )
    ARG=$( echo $ARG | cut -d "=" -f 1 )

    if [ $OPT = $ARG ]
    then
        OPT=$1
    fi

    case "$ARG" in
    	"--help"|"-h")
        	HELP="1";;
        "--test-keywords")
		    TESTKEYWORDFILE="$OPT";;
        "--val-keywords")
		    VALKEYWORDFILE="$OPT";;
        "--random"|"-r")
            RANDOM_LINES="1";;
    	"--longest"|"-m")
            LONGESTLINE="1";;
        "--shortest"|"-c")
            SHORTESTLINE="1";;
        "--src-lang"|"-s")
	        SRCLANG="$OPT";;
    	"--trg-lang"|"-t")
	        TRGLANG="$OPT";;
       	"--test-lines"|"-l")
	        TESTLINES="$OPT";;
        "--val-lines"|"-k")
            VALLINES="$OPT";;
        "\?")
            HELP="1";;
    esac
done

if test $HELP -eq "1"
then
    echo "Use one or more of the following options:"
    echo "\t--help / -h to display this message"
    echo "\t--src-lang / -s to set the source language"
    echo "\t--trg-lang / -t to set the target language"
    echo "\t--test-lines / -l to set the number of test lines"
    echo "\t--val-lines / -k to set the number of validation lines"
    echo "\t--random / -r to split based on random selection"
    echo "\t--test-keywords to split based on keywords in test_keywords.txt file"
    echo "\t--val-keywords to split based on keywords in val_keywords.txt file"
    echo "\t--longest / -m to add longest lines to the test file"
    echo "\t--shortest / -c to add shortest lines to the test file"
fi

totallines=$(( TESTLINES + VALLINES )) #totallines for test and validation set

red="`tput setaf 1`" #colour red for using with echo errors
norm="`tput sgr0`" #return to normal colour text

export VALLINES #make a global variable
export TESTLINES #make a global variable
export SRCLANG
export TRGLANG
export RANDOM_LINES
export TESTKEYWORDFILE
export VALKEYWORDFILE
export LONGESTLINE
export SHORTESTLINE
export totallines
export red
export norm
