#!/bin/bash

subreddits=( "videos" "privacy" "linux" )

for i in "${subreddits[@]}"
do
   wget http://www.reddit.com/r/$i.json

   #isolate urls from json data into a file
   cat $i.json | grep -Po '"url":.*?[^\\]",' >> url_list-tmp.txt
done

#remove the json url identifier leaving just a quoted comma separated list of urls
sed -e 's/"url": //' url_list-tmp.txt > url_list-tmp2.txt

#remove the commas leaving only quoted urls
sed s'/.$//' url_list-tmp2.txt > url_list.txt

#clean up
rm url_list-tmp.txt
rm url_list-tmp2.txt

#remove the json files
for i in "${subreddits[@]}"
do
   rm $i.json
done

#isolate the youtube videos into their own list and remove them from the main list
cat url_list.txt | grep youtube > url_youtube.txt
cat url_list.txt | grep -v youtube > url_list-tmp.txt
mv url_list-tmp.txt url_list.txt

#remove the internal reddit links from the main list
cat url_list.txt | grep -v reddit.com > url_list-tmp.txt
mv url_list-tmp.txt url_list.txt
