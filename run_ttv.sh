#!/bin/sh

sh get_arguments.sh #assigns arguments

source get_arguments.sh #gets variables assigned

sh checktestvallines.sh #checks if val and test lines set

sh projectdownload.sh #downloads files

sh sourcetargetlang.sh #checks for source and target language and runs isolate file

sh output.sh #outputs information
