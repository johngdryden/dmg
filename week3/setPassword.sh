#!/bin/bash

read -p "Folder name : " foldername

mkdir "$foldername"

echo -n Password:

read -s password

echo "$password" | sha256sum >> secret.txt
 
mv secret.txt "$foldername"