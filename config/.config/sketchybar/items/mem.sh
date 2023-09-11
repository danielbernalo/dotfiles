#!/usr/bin/env bash

mem=(
    update_freq=10  
    icon.font="Font Awesome 6 Free:Solid:15.4"
    icon.padding_right=4
    icon.color=0xfff5c1e6
    icon.y_offset=-3
    label.y_offset=-3
    label.font="$FONT:Medium:19.0"
    label.color=0xff47455c
    label.padding_right=8
    background.drawing=on
    background.color=0xfff4f5f8
    script="$PLUGIN_DIR/mem.sh"
)

sketchybar --add item mem right   \
           --set mem "${mem[@]}"