#!/bin/bash

arg_count=$#

if [ ${arg_count} != 2 ]; then
#echo "fail, must have 2 arguments"
exit 1
fi

writefile=$1 #full path to file (including name)
writestr=$2


if mkdir -p "$(dirname "$writefile")" && touch "$writefile"; then
 : #echo sucesffuly made directory and file
else
 : #echo failed to make directory anf file
fi

#if touch "$writefile"; then
#echo "successfully created file, ${writefile}"
#else
#echo "error, invalid 'writefile' argument"
#exit 1
#fi

echo "$writestr" > "$writefile"

exit 0