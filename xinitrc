#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Java UIs mess up in BSPWM	
export _JAVA_AWT_WM_NONREPARENTING=1
xsetroot -cursor_name left_ptr

sxhkd &
mate-power-manager &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
nm-applet &
${HOME}/.config/polybar/launch.py &

exec bspwm
