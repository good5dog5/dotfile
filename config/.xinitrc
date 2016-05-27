#!/usr/bin/env bash

# if [ -d /etc/X11/xinit/xinitrc.d ]; then
#     for i in /etc/X11/xinit/xinitrc.d/* ; do
#         if [ -x "$i" -a ! -d "$i" ]; then
#             . "$i"
#         fi
#     done
# fi
# 
# [[ -f ~/.xinitrc.local ]] && . ~/.xinitrc.local
# 
# [[ -f ~/.Xresources ]] && xrdb ~/.Xresources
# [[ -f ~/.Xresources.local ]] && xrdb -merge ~/.Xresources.local
# 
# if [[ $(uname) == "Linux" ]]; then
#   xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
# fi
# 
# xset +fp /usr/share/fonts/local
# xset +fp ~/.fonts
# xset fp rehash
# # Disable pc speaker
# xset -b
# xrandr --dpi 96

xset r rate 180 40 # Sane repeat rate
xset -b            # No bell
xset -dpms         # Keep screen on at all times
[ -f ~/.xprofile ] && source ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge "${HOME}/.Xresources"

/usr/lib/policykit-1/polkitd --no-debug
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)

xrandr --output VGA1 --mode 1440x900


# pulse audio session
start-pulseaudio-x11

udiskie &
dropboxd &

# backlight
xbacklight -set 65
exec i3
