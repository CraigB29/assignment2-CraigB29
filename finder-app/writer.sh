#!/bin/sh



arg_count=$#


#check that 2 arguments were passed
if [ $arg_count != 2 ]; then
    echo "must have 2 arguments"
    exit 1
else
    :
fi

#acquire arguments
writefile=$1  #path including file name
writestr=$2

# seperate path from file name
file_name=$(basename "$writefile")
path=$(dirname "$writefile")




#make directory/directories 
mkdir -p "$path"

#delete file (if it exists)
rm "$writefile"

#make file
touch "$writefile"

echo "$writestr" > "$writefile"

exit 0

## check argument count is correct
#arg_count=$#
#
#if [ ${arg_count} != 2 ]; then
##echo "fail, must have 2 arguments"
#exit 1
#fi
#
##acquire arguments (full path to file including name AND write string)
#writefile=$1 
#writestr=$2
#
#
##make the folder and file if they do not exist
#if mkdir -p "$(dirname "$writefile")" && touch "$writefile"; then
# : #echo sucesffuly made directory and file
#else
# : #echo failed to make directory and file
#fi
#
#
##write string to file
#echo "$writestr" > "$writefile"
#
##success
#exit 0