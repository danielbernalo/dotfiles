#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh"

Sourcesystem=$(SwitchAudioSource -c)

if [ "$Sourcesystem" = "PRO X Wireless Gaming Headset" ]; then
    sketchybar --set $NAME icon.color=$RED
else
    sketchybar --set $NAME icon.color=$WHITE
fi