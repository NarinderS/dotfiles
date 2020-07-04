# Java UIs mess up in BSPWM
export _JAVA_AWT_WM_NONREPARENTING=1
xsetroot -cursor_name left_ptr

sxhkd &
${HOME}/.screenlayout/dual.sh
${HOME}/.config/polybar/launch.py
mate-power-manager &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
nm-applet &

exec bspwm
