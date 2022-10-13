
Optional systemd service files to be installed on the Pi that autostart the scripts that watch for ther MC400 writing messages/images and do the necessary processing

See https://www.thedigitalpictureframe.com/ultimate-guide-systemd-autostart-scripts-raspberry-pi/ for a tutorial on how/where to install these files.

If these service definitions are not installed then the mc400_watch_email/tweet/image.sh scripts will need to be started manually everytime the Pi is booted.
