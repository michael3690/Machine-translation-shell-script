#!/bin/sh

echo "Confirming language files are available..."

filename=""$SRCLANG"-"$TRGLANG".csv"

url=https://ca114project.s3-eu-west-1.amazonaws.com/CA114_project_files/$filename
#checks if file exists on server
if wget --spider $url 2>/dev/null 
 then
    wget -c https://ca114project.s3-eu-west-1.amazonaws.com/CA114_project_files/$filename
    echo "language file downloaded"
else
    echo "${red}Combination of source and target language not currently available${norm}"
    trap "kill 0" EXIT #terminates script
fi
