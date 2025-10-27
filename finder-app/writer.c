/*arg_count=$#


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
*/

#include <stdio.h>
#include <syslog.h>
//acquire arguments

//how to check log:

//sudo journalctl -t writer



int main(int argument_count, char *argv[])
{
    printf("hello world\r\n");
    FILE *file_ptr = NULL;
    //openlog("./mylog.txt", SOMETHING, LOG_USER)
    openlog(NULL, 0, LOG_USER);
    if(argument_count!=3)
    {
        syslog(LOG_ERR, "Argument count is %d, Must have 2 arguments", argument_count-1);
        return 1; //fail, should be 2 arguments
    }
    else
    {
        file_ptr = fopen(argv[1],"w");

        if(file_ptr == NULL)
        {
            printf("failed to open file, %s", argv[1]);
            syslog(LOG_ERR, "failed to open file, %s", argv[1]);
            return 1;
        }
        else
        {
            printf("Writing %s to %s", argv[2], argv[1]);
            syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
            fprintf(file_ptr, "%s", argv[2]);
            fclose(file_ptr);
            return 0;
        }

        
    }

    return 1;


}