#!/bin/bash
source "$HOME/.config/sketchybar/colors.sh"

Sourcesystem=$(SwitchAudioSource -c)

if [ "$Sourcesystem" = "PRO X Wireless Gaming Headset" ]; then
    sketchybar --set $NAME label="ON"
else
    sketchybar --set $NAME label="OFF"
fi