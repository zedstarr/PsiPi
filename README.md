
![Tweeting in action on MC400](https://zedstarr.files.wordpress.com/2021/09/screen2021-09-21-152350.png)

# PsiPi
Some Pi shell scripts and Psion OPL to link the Psion MC400 to "the internet" via a Raspberry Pi and enable simple email/tweet sending and image conversion.

see http://bit.ly/MC400cxf for more details

Some prerequisites: 
  1. on the Pi - dosbox-x, rainbowstream, msmtp, imagemagick, rclone - all installed and configured. Psion DOS programs MCLINK.EXE and WSPCX.EXE
  2. on the MC400 - "The Link" is running, MAIL.OPO to send emails, TWEET.OPO to send tweets and SRCN_SAV.OPO to transfer SCREEN.PIC files
  3. physical connectivity - MC400 serial port connected to Raspberry Pi to /dev/ttyUSB0 with USB-serial adapter that supports DSR/DTR e.g. the Prolific PL2303
  4. rclone is configured to sync to Google drive. Image conversion syncs all images and also uses bitly's API to shorten the Google drive links.

![Transferring screenshots on the MC400](https://zedstarr.files.wordpress.com/2021/09/screen2021-09-21-122530.png)

![Helper scripts running watching for files written from the MC400](https://zedstarr.files.wordpress.com/2021/09/screenshot-from-2021-09-14-14-31-57.png)
