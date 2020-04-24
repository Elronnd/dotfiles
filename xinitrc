#!/bin/sh

cd
eval `ssh-agent`
xrdb -merge .Xresources
xscreensaver -no-splash&
#jackd -R -dalsa -dhw:1&
pulseaudio&
buici-clock -geometry 76x76-0+0 --show-second-hand 0&
xset r rate 400 60

dbus-launch fvwm
