#!/bin/bash

calendar=(
  icon=cal
  icon.font="$FONT:Black:$FONT_SIZE"
  icon.padding_right=0
  label.width=125
  padding_left=15
  label.align=right
  icon.y_offset=-3
  label.y_offset=-3
  update_freq=30
  label.color=0xff47455c
  icon.color=0xff47455c 
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
