#!/bin/bash

echo -n Password:

read -s password

FileLocation=$HOME/scripts/portfolio/week3/Winnie/secret.txt

if echo $password | sha256sum -c --status $FileLocation ; then
    echo -e "\nAccess Granted"
    exit 0
else
    echo -e "\nAccess Denied"
    exit 1
fi
