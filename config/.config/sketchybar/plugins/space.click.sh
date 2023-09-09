#!/bin/sh

space_id=$(echo $NAME | sed "s/space.//")
yabai -m space --focus $space_id && sketchybar --trigger space_change