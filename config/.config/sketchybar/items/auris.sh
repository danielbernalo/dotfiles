#!/bin/bash

auris=(
  icon=🎧
  icon.font="$FONT:Black:12.0"
  icon.padding_right=0
  label.width=10
  label.align=right
  padding_left=15
  update_freq=30
  script="$PLUGIN_DIR/auris.sh"
  click_script="$PLUGIN_DIR/auris.click.sh"
)

sketchybar --add item auris right       \
           --set auris "${auris[@]}" \
           --subscribe auris system_woke
