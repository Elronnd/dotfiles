#!/usr/bin/env zsh

cd
eval `ssh-agent`
xrdb -merge ~/.Xresources
xscreensaver -no-splash&
#jackd -R -dalsa -dhw:1&
#if [ $(uname) != FreeBSD ]; then (pulseaudio&); fi
buici-clock -geometry 76x76-0+0 --show-second-hand 0&
#xset r rate 400 60
xset r rate 300 65
setxkbmap -layout us,apl -variant dyalog -option grp:rwin_switch
keyfun&disown
light 20
(xterm -fullscreen -bg black -fg white -fa - -fs 12 -e ssh-add; gnome-terminal -- ssh slashem)&
#oneko -tora -fg '#ff7f00' -bg black&

dbus-launch fvwm
