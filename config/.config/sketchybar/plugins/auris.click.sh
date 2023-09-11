#!/bin/bash

auri="PRO X Wireless Gaming Headset"
system_out="Built-in Output"
system_in="Logitech Webcam C925e"

Sourcesystem=$(SwitchAudioSource -c)

if [ "$Sourcesystem" = "PRO X Wireless Gaming Headset" ]; then
    SwitchAudioSource -t input -s "$system_in"
    SwitchAudioSource -t output -s "$system_out"
    sketchybar --set $NAME label="ON"
else
    SwitchAudioSource -t input -s "$auri"
    SwitchAudioSource -t output -s "$auri"
    sketchybar --set $NAME label="OFF"
fi;