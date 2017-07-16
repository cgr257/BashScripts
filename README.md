# BashScripts
Collection of random bash scripts

staywoke.sh
move the mouse once every two minutes

RandEnc.sh
get arbitrary number of bytes from /dev/urandom, encrypt them with a gpg public key, then email the encrypted file to a user specified email address

redditrip.sh
link scraper for reddit.com. Gets .json data for subreddits specified at the top of the script then puts external links in two text files, one for links to youtube.com and one for links to everything else. If desired other tools like wget or youtube-dl could then be used to process the resulting lists to, e.g. automatically download all of the videos from youtube that are currently on the front page of reddit.com/r/videos.
