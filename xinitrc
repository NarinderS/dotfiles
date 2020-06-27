xsetroot -cursor_name left_ptr

# Java UIs mess up in BSPWM
export _JAVA_AWT_WM_NONREPARENTING=1

sxhkd &
mate-power-manager &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
/usr/lib/mate-polkit/polkit-mate-authentication-agent-1  &
${HOME}/.screenlayout/dual.sh &
nm-applet &
pasystray &
${HOME}/.config/polybar/launch.sh bspwm &

exec bspwm
