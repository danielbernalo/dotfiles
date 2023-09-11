#!/bin/bash

auris=(
  icon=
  icon.font="Font Awesome 6 Free:Solid:15.4"                  \
  update_freq=30
  icon.padding_right=4                                        \
  icon.color=0xffb9c244                                       \
  icon.y_offset=-3                                                 \
  label.y_offset=-3                                        \
  label.font="$FONT:Medium:$FONT_SIZE"                                \
  label.color=0xff47455c                                      \
  background.y_offset=-3                                       
  script="$PLUGIN_DIR/auris.sh"
  click_script="$PLUGIN_DIR/auris.click.sh"
  background.padding_right=10
  
)

sketchybar --add item auris right       \
           --set auris "${auris[@]}"
