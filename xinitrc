#!/bin/sh

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
light 40
xterm -e ssh-add&
gnome-terminal&
#oneko -tora -fg '#ff7f00' -bg black&

dbus-launch fvwm
