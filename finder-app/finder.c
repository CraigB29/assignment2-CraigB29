#include <stdio.h>
#include <syslog.h>

int main(int argument_count, char *argv[])
{
    printf("hello world\r\n");
    FILE *file_ptr = NULL;
    //openlog("./mylog.txt", SOMETHING, LOG_USER)
    openlog(NULL, 0, LOG_USER);
    if(argument_count!=3)
    {
        syslog(LOG_ERR, "Argument count is %d, Must have 2 arguments", argument_count-1);
        return -1; //fail, should be 2 arguments
    }
    else
    {
        file_ptr = fopen(argv[1],"w");

        if(file_ptr == NULL)
        {
            printf("failed to open file, %s", argv[1]);
            syslog(LOG_ERR, "failed to open file, %s", argv[1]);
            return -1;
        }
        else
        {
            printf("Writing %s to %s", argv[2], argv[1]);
            syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
            fprintf(file_ptr, argv[2]);
            fclose(file_ptr);
            return 0;
        }

        
    }


}