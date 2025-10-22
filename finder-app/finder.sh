#!/bin/sh

#check argument count
arg_count=$#

if [ ${arg_count} != 2 ]; then
echo "fail, must have 2 arguments"
exit 1
fi

#acquire arguments (file directory and searchstr)
filesdir=$1
searchstr=$2

#check if directory exists
#if [ -d "$filesdir" ];then
if [ find "$filesdir" -type d ];then
    : #echo "directory exists!"
else
    #echo "directory DOES NOT EXIST"
    exit 1
fi



# get file count in folder
file_count=$(find ${filesdir} -type f | wc -l)


# get the number of string matches within the files int the folder
match_line_count=$(grep -r "$searchstr" "$filesdir" | wc -l)
#print the file and matched line count
echo "The number of files are ${file_count} and the number of matching lines are ${match_line_count}"

#return succes
exit 0
