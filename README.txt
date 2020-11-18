Guide to using the TTV Component created by Michael Donohoe, Mary Mulready and Aisling Purdy, Group D

Input is given through arguments on the shell script run_ttv.sh

Example input:
sh run_ttv.sh -h (This displays a help message with details on how to use the program)

sh run_ttv.sh -s EN -t ES -l 1000 -k 2000 (This runs the program without a specific selection method. The test file will contain the first 1000 lines of the language file downloaded and the validation file will contain the next 2000 lines. The training file will contain all lines after the first 3000)

sh run_ttv.sh -s EN -t ES -l 1000 -k 2000 -r (The same as above except the lines will be in a randomized)

sh run_ttv.sh -s EN -t ES -l 1000 -k 2000 -m (The file will be sorted from longest to shortest line and then split into test, validation and training files each containing the requested number of lines similar to above)

sh run_ttv.sh -s EN -t ES -l 1000 -k 2000 -c (The file will be sorted from shortest to longest line and then split into test, validation and training files each containing the requested number of lines similar to above)

sh run_ttv.sh -s EN -t ES -l 1000 -k 2000 --test-keywords=test_keywords.txt (The keywords contained in the test_keywords.txt file will be searched for in the language file downloaded and the first 1000 lines with keyword matches will be placed in the test file. The validation file will contain 2000 lines of the remaining lines in the language file and the training file will contain the rest)

sh run_ttv.sh -s EN -t ES -l 1000 -k 2000 --val-keywords=val_keywords.txt (similar to above but the validation file will contain the first 2000 lines of matches from the keywords contained in val_keywords.txt)

sh run_ttv.sh -s EN -t ES -l 1000 -k 2000 --test-keywords=test_keywords.txt --val-keywords=val_keywords.txt (both the test and validation file will contain keyword matches)

!Please note no two methods of selection can be used together with the exception of test and val keywords!
i.e. random selection may not be used at the same time as shortest lines selection


HOW THE CODE WORKS:
The run_ttv shell script runs assigning the arguments to variables.

The checktestvallines shell script then runs. This script ensures a number of lines is inputted for the test and validation files.

Next the projectdownload shell script runs. This checks if a file containing both the source and target language is available on the server. If the file is available it then downloads this file, otherwise it outputs an error on the terminal.

Next the sourcetargetlang shell script is run. This script runs a checklines script to ensure the total of requested lines for the test and validation files doesn't exceed the total number of lines in the downloaded language file. This ensures the training file won't be empty.

The isolatelanguages shell script is then run. This script runs an error script to ensure no more than one selection method was selected. The isolatelanguages script then checks which selection method was requested and runs the corresponding shell script to carry out the requested method of selection. 

When the test,validation and training files have been created for both the source and target languages the output shell script is then run.

The output shell script outputs information about the source and target language as well as the selection method used. It then runs the wordcount and linecount scripts to output a word and linecount for each of the files created.