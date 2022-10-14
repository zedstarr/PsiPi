#!/bin/bash

/usr/bin/inotifywait -m /home/pi/mc400/TWEET/INBOX/ -e create  |
  while read dir action file; do
    # echo "The file '$file' appeared in directory '$dir' via '$action'"
    # do something with the file
    if [[ "$file" == "TWEET.TXT" ]] ; then
      # echo "`date` Tweeting..."
      sleep 3
      content=`cat /home/pi/mc400/TWEET/INBOX/TWEET.TXT`
      /usr/bin/printf "\nt $content\nexit()" | /usr/local/bin/rainbowstream
      sleep 12
      mv /home/pi/mc400/TWEET/INBOX/TWEET.TXT /home/pi/mc400/TWEET/OUTBOX/TWEET`date +"%Y-%m-%d-%H%M%S"`.TXT
    fi
  done
