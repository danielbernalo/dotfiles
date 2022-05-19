#!/bin/bash
xx=$(yabai -m query --windows --window)
wid="$(echo $xx | jq -re ".id")"
echo Inteljj $wid
yabai -m window "${wid}"  --toggle float