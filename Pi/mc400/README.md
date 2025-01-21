
Files written from the MC400 OPL progs go in the EMAIL/INBOX, TWEET/INBOX or IMAGE/INBOX subfolders here.

The shell scripts in the scripts folder mc400_watch_email/tweet/image.sh detect these files being written and do the appropriate processing.

After processing time+date-tagged copies are placed in EMAIL/OUTBOX, TWEET/OUTBOX or IMAGE/OUTBOX.

Images are synced to google drive after conversion. The script 'short.sh' uses bitly's API (you'll need to request your own access token) to shorten the google drive link to the converted file. The most recently shortened URL is always in IMAGE/OUTBOX/latest.txt

