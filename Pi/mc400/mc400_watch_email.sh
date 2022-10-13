#!/bin/bash

/usr/bin/inotifywait -m /home/pi/mc400/EMAIL/INBOX/ -e create  |
  while read dir action file; do
    # echo "The file '$file' appeared in directory '$dir' via '$action'"
    # do something with the file
    if [[ "$file" == "EMAIL.TXT" ]] ; then
      # echo "`date` Emailing..."
      sleep 3
      /usr/bin/printf "`cat /home/pi/mc400/EMAIL/INBOX/EMAIL.TXT`\n\n-- \nSent from a Psion MC400\nhttps://bit.ly/MC400cxf\n" | msmtp `cat /home/pi/mc400/EMAIL/INBOX/EMAIL.TXT | cut -c5- | cut -f1 -d\\`
      sleep 2
      mv /home/pi/mc400/EMAIL/INBOX/EMAIL.TXT /home/pi/mc400/EMAIL/OUTBOX/EMAIL`date +"%Y-%m-%d-%H%M%S"`.TXT
    fi
  done
