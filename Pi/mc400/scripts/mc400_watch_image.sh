#!/bin/bash

/usr/bin/inotifywait -m /home/pi/mc400/IMAGE/INBOX/ -e create  |
  while read dir action file; do
    # echo "The file '$file' appeared in directory '$dir' via '$action'"
    # do something with the file
    if [[ "$file" == "SCREEN.PIC" ]] ; then
      # echo "`date` Converting..."
      # sleep 30
      /usr/bin/inotifywait -qq /home/pi/mc400/IMAGE/INBOX/SCREEN.PIC -e close_write
      sleep 1
      # ls -la /home/pi/mc400/IMAGE/INBOX/
      mv /home/pi/mc400/IMAGE/INBOX/SCREEN.PIC /home/pi/wspcx/SCREEN.PIC
      SDL_VIDEODRIVER=dummy /usr/bin/dosbox-x -conf /home/pi/wspcx/dosbox-x-0.83.16.conf /home/pi/wspcx/WSPCX.BAT -exit
      sleep 1
      /usr/bin/convert /home/pi/wspcx/SCREEN.PCX /home/pi/wspcx/SCREEN.PNG
      nameroot=SCREEN`date +"%Y-%m-%d-%H%M%S"`
      mv /home/pi/wspcx/SCREEN.PIC /home/pi/mc400/IMAGE/OUTBOX/${nameroot}.PIC
      mv /home/pi/wspcx/SCREEN.PCX /home/pi/mc400/IMAGE/OUTBOX/${nameroot}.PCX
      mv /home/pi/wspcx/SCREEN.PNG /home/pi/mc400/IMAGE/OUTBOX/${nameroot}.PNG
      sleep 1
      /usr/bin/rclone sync /home/pi/mc400/IMAGE/OUTBOX/ gdrive:mc400/IMAGE/OUTBOX/
      /home/pi/mc400/scripts/short.sh `/usr/bin/rclone link gdrive:mc400/IMAGE/OUTBOX/${nameroot}.PNG` > /home/pi/mc400/IMAGE/OUTBOX/${nameroot}.TXT
    fi
  done
