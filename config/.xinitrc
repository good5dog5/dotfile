#!/usr/bin/env bash
# vim: ft=sh


export DISPLAY_ID=`hostname`$DISPLAY # Set the DISPLAY_ID variable, used for logging.

ENABLE_DEBUG=false                   # Environment Variables ##
LOGFILE="${HOME}/xinit-$DISPLAY_ID.log"

## Logging and Error-Handling Functions ##
log ()
{
	echo "[$(date --rfc-3339=seconds )]  $1" >> $LOGFILE
}
debug ()
{
	$ENABLE_DEBUG && log "$@"
}

rm -r $LOGFILE

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for i in /etc/X11/xinit/xinitrc.d/* ; do
        if [ -x "$i" -a ! -d "$i" ]; then
            . "$i"
        fi
    done
fi

 
xmodmap "${HOME}/.xmodmaprc"

xset +fp /usr/share/fonts/local
xset +fp ~/.fonts
xset fp rehash

xset r rate 180 45 # keyboard settings, typematic delay to xxxms and a typematic rate to xxHz
xset -b            # No bell
xset -dpms         # Keep screen on at all times

[ -f "${HOME}/.Xresources" ] && xrdb -merge "${HOME}/.Xresources"

xrandr --dpi 96

/usr/lib/policykit-1/polkitd --no-debug
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
synclient TouchpadOff=1
source ~/.xprofile

[ -f "${HOME}/.xprofile" ] && log "xprofile exist" && source ${HOME}/.xprofile
#source ~/.xprofile

# pulse audio session
start-pulseaudio-x11

udiskie &
dropboxd &

#######################################################################
#                        set trackpoint speed                         #
#######################################################################

case "$HOSTNAME" in
    JLab)
        xinput --set-prop "10" "Device Accel Constant Deceleration" 0.3
        xinput --set-prop "10" "Evdev Wheel Emulation Timeout" 200
    ;;
    JTP)
        echo  -n 180 /sys/devices/platform/i8042/serio1/serio2/speed
        echo  -n 250 /sys/devices/platform/i8042/serio1/serio2/sensitivity
    ;;
    jordan-SCOPE)
        xinput --set-prop 10 272 0.3
        # reference https://askubuntu.com/questions/205676/how-to-change-mouse-speed-sensitivity
    ;;
esac

# backlight
xbacklight -set 65
exec i3 -V > ~/i3log-$(date + '%F-%k-%M-%S') 2>&1
