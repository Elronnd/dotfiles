#!/usr/bin/env zsh

cd
eval `ssh-agent`
xrdb -merge ~/.Xresources
xscreensaver -no-splash &
#jackd -R -dalsa -dhw:1&
#if [ $(uname) != FreeBSD ]; then (pulseaudio&); fi
#xset r rate 400 60
xset r rate 300 65
setxkbmap -layout us,apl -variant dyalog -option grp:rwin_switch
keyfun&
#oneko -tora -fg '#ff7f00' -bg black&

dbus-launch fvwm
