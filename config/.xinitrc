#!/usr/bin/env bash
# vim: ft=sh

ENABLE_DEBUG=false                   # Environment Variables ##

export DISPLAY_ID=`hostname`$DISPLAY # Set the DISPLAY_ID variable, used for logging.


## Logging and Error-Handling Functions ##
log ()
{
	echo "[$(date --rfc-3339=seconds )]  $1" > $HOME/xinit-$DISPLAY_ID.log
}

debug ()
{
	$ENABLE_DEBUG && log "$@"
}

log "Starting .xinitrc"

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for i in /etc/X11/xinit/xinitrc.d/* ; do
        if [ -x "$i" -a ! -d "$i" ]; then
            . "$i"
        fi
    done
fi

 
if [[ $(uname) == "Linux" ]]; then
  xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
fi

 xset +fp /usr/share/fonts/local
 xset +fp ~/.fonts
 xset fp rehash

xset r rate 180 40 # Sane repeat rate
xset -b            # No bell
xset -dpms         # Keep screen on at all times

[ -f "${HOME}/.Xresources" ] && xrdb -merge "${HOME}/.Xresources"

xrandr --dpi 96
#xrandr --output VGA1 --mode 1440x900

/usr/lib/policykit-1/polkitd --no-debug
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
synclient TouchpadOff=1
source ~/.xprofile

# pulse audio session
start-pulseaudio-x11

udiskie &
dropboxd &

# backlight
xbacklight -set 65
exec i3 -V > ~/i3log-$(date + '%F-%k-%M-%S') 2>&1
