#!/bin/bash

#create a file containing random data, encrypt it with gpg, then email it to a specified address

#set variables
email="alice@example.com"
gpg_recipient="Alice"

#wait for a random interval between 1 second and 1 hour before continuing
waittime=$[ 1 + $[ RANDOM % 3600 ]]
sleep $waittime

#grab current date/time 
now=`date +%Y%m%d%H%M%S`

#get random number of bytes of data (between 256 - 4096) from /dev/urandom and save it in a file
bytes=$[ 256 + $[ RANDOM % 4096 ]]
head -c $bytes /dev/urandom | openssl enc -base64 > $now.txt

#encrypt the random data with public gpg key of person set above 
gpg --recipient "$gpg_recipient" --armor --encrypt $now.txt

#email the gpg encrypted random data to the address set above. This requires the mail program to be set up already
mail -s "$now" $email < $now.asc
