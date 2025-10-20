#!/bin/sh

#chatgptk utilized for syntax and invididual command formulation (not whole implementation)

#echo "You passed $# arguments."

arg_count=$#


if [ ${arg_count} != 2 ]; then
echo "fail, must have 2 arguments"
exit 1
fi

filesdir=$1
searchstr=$2

if [ -d "$filesdir" ];then
    : #echo "directory exists!"
else
    #echo "directory DOES NOT EXIST"
    exit 1
fi

#echo "<<<arguments filesdir = ${filesdir}, searchstr = ${searchstr}"


# get file count in folder
file_count=$(find ${filesdir} -type f | wc -l)


# get the number of string matches
#match_line_count=$(find ${filesdir} | grep ${searchstr} | wc -l)
match_line_count=$(grep -r "$searchstr" "$filesdir" | wc -l)

#print
echo "The number of files are ${file_count} and the number of matching lines are ${match_line_count}"
#echo "The number of files are ${file_count} and the number of matching lines are ${match_line_count}"

exit 0
#if[0 != cd ${filesdir}];then
#exit 1
#fi

#filesdir echo "Hello, $1!"
#searchstr echo "Your favorite color is $2."


#exit 1