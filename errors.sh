#!/bin/sh

if test "$TESTKEYWORDFILE" && test "$RANDOM_LINES" #checks if Keyword selection and random selection used
then
    echo "${red}Keyword selection and random selection not compatible${norm}"
    trap "kill 0" EXIT #terminates script
fi
if test "$VALKEYWORDFILE" && test "$RANDOM_LINES" #checks if Keyword selection and random selection used
then
    echo "${red}Keyword selection and random selection not compatible${norm}"
    trap "kill 0" EXIT #terminates script
fi
if test "$LONGESTLINE" && test "$RANDOM_LINES" #checks if longest line selection and random selection used
then
    echo "${red}Longest line selection and random selection not compatible${norm}"
    trap "kill 0" EXIT #terminates script
fi
if test "$SHORTESTLINE" && test "$RANDOM_LINES" #checks if shortest line selection and random selection used
then
    echo "${red}Shortest line selection and random selection not compatible${norm}"
    trap "kill 0" EXIT #terminates script
fi
if test "$TESTKEYWORDFILE" && test "$SHORTESTLINE" #checks if Keyword selection and shortest line selection used
then
    echo "${red}Keyword selection and shortest line selection not compatible${norm}"
    trap "kill 0" EXIT #terminates script
fi
if test "$VALKEYWORDFILE" && test "$SHORTESTLINE" #checks if Keyword selection and shortest line selection used
then
    echo "${red}Keyword selection and shortest line selection not compatible${norm}"
    trap "kill 0" EXIT #terminates script
fi
if test "$TESTKEYWORDFILE" && test "$LONGESTLINE" #checks if Keyword selection and longest line selection used
then
    echo "${red}Keyword selection and longest line selection not compatible${norm}"
    trap "kill 0" EXIT #terminates script
fi
if test "$VALKEYWORDFILE" && test "$LONGESTLINE" #checks if Keyword selection and longest line selection used
then
    echo "${red}Keyword selection and longest line selection not compatible${norm}"
    trap "kill 0" EXIT #terminates script
fi
if test "$SHORTESTLINE" && test "$LONGESTLINE" #checks if shortest line selection and longest line selection used
then
    echo "${red}Shortest line selection and longest line selection not compatible${norm}"
    trap "kill 0" EXIT #terminates script
fi
