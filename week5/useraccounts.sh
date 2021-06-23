#!/bin/bash

awk '
# BEGIN section of awk script that will be run once. Sets field seperator to ":" and prints table header
BEGIN {
    FS=":";
    printf "\n"
    print "| \033[34mUsername\033[97m\t   | \033[34mUserID\033[97m | \033[34mGroupID\033[97m | \033[34mHome\t\t\t\033[97m | \033[34mShell\033[97m\t     |";
    print "|____________________________________________________________________________________|";
}
# Match only lines that contain "/bin/bash" and print to stdout
/\/bin\/bash/{
    printf ("| \033[33m%-16s\033[97m | \033[35m%-6d\033[97m | \033[35m%-7d\033[97m | \033[35m%-24s\033[97m | \033[35m%-17s\033[97m |\n", $1, $3, $4, $6, $7);
}
# END section that runs once and prints the table footer to stdout
END {
    print "|____________________________________________________________________________________|";
}
    
' /etc/passwd 

exit 0
