#!/bin/bash

# check argument count is correct
arg_count=$#

if [ ${arg_count} != 2 ]; then
#echo "fail, must have 2 arguments"
exit 1
fi

#acquire arguments (full path to file including name AND write string)
writefile=$1 
writestr=$2


#make the folder and file if they do not exist
if mkdir -p "$(dirname "$writefile")" && touch "$writefile"; then
 : #echo sucesffuly made directory and file
else
 : #echo failed to make directory and file
fi


#write string to file
echo "$writestr" > "$writefile"

#success
exit 0