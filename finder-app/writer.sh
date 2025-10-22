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

