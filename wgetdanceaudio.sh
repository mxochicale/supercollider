#!/bin/bash

# Miguel Perez-Xochicale
# Mon Oct 12 15:10:20 BST 2015

#
# chmod 755 nobel_prize_talks.sh
# ./wgetdanceaudio.sh
#

# The purpose of this script is to download a list of youtube songs.
# I have to said that I don't have any rights for the music files.
# I am only interested in those files as a data to test the algorightms.
# If I am committing anything against the copyright, please let me know
# and I modify the script.
#  ~@mxochicale  21:29 Wed April 9 2017
#
# For free sounds go to https://www.freesound.org/people/wordswar/packs/12007/
#
#

clear

echo
echo
echo "Download Dance Audio Songs"
echo
echo

mkdir danceaudio
cd danceaudio

youtube-dl https://www.youtube.com/watch?v=yKNrWQrzs5M

youtube-dl https://www.youtube.com/watch?v=o7mKiw6-w9M

youtube-dl https://www.youtube.com/watch?v=mtj3inp8hCE

youtube-dl https://www.youtube.com/watch?v=8bV55Q0UTMg

youtube-dl https://www.youtube.com/watch?v=o7mKiw6-w9M

youtube-dl https://www.youtube.com/watch?v=v7utp8YlZYo

youtube-dl https://www.youtube.com/watch?v=3mrq57zI4-Y


echo
echo "========================="
echo "          done        :)  "
echo "========================="
echo
