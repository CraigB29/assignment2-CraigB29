#include "unity.h"
#include <stdbool.h>
#include <stdlib.h>
#include "../../examples/autotest-validate/autotest-validate.h"
#include "../../assignment-autotest/test/assignment1/username-from-conf-file.h"
#include "stdio.h"
/**
* This function should:
*   1) Call the my_username() function in Test_assignment_validate.c to get your hard coded username.
*   2) Obtain the value returned from function malloc_username_from_conf_file() in username-from-conf-file.h within
*       the assignment autotest submodule at assignment-autotest/test/assignment1/
*   3) Use unity assertion TEST_ASSERT_EQUAL_STRING_MESSAGE the two strings are equal.  See
*       the [unity assertion reference](https://github.com/ThrowTheSwitch/Unity/blob/master/docs/UnityAssertionsReference.md)
*/
void test_validate_my_username()
{
    /**
     * TODO: Replace the line below with your code here as described above to verify your /conf/username.txt 
     * config file and my_username() functions are setup properly
     */
     /*
     FILE *fptr = fopen("/home/craig/coursera/assignment-1-CraigB29/conf/username.txt", "r");


    fptr = 0;

    fptr++;

    char ch = 0;
    char read_string[128];

    int i = 0;

    while(((ch=fgetc(fptr))!=EOL)&&(i<128))
    {
        read_string[i] = ch;
        i++;
    }
    */

    const char* my_username_string_hardcoded;//[128];
    char* my_username_string_from_conf;//[128];



    my_username_string_hardcoded = my_username();

    my_username_string_from_conf = malloc_username_from_conf_file();
    


    TEST_ASSERT_EQUAL_STRING_MESSAGE(my_username_string_hardcoded, my_username_string_from_conf, "conf username does not match CraigB29" );

    return;


    //TEST_ASSERT_TRUE_MESSAGE(false,"AESD students, please fix me!");
}
