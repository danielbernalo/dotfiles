#! /usr/bin/env sh
xx=$(yabai -m query --windows --window)
wid="$(echo $xx | jq -re ".id")"

# if the split is horizontal, toggle it to vertical
# yabai -m query --windows --window "${wid}" --stack weast | jq -re '.split == "horizontal"' \
#    && yabai -m window ${wid} --stack $(yabai -m query --windows --window | jq -r '.id')
# yabai -m query --windows --window "${wid}" --stack ${wid} | jq -re '.split == "horizontal"' \
    #  && yabai -m window "${wid}" --toggle split
# yabai -m window "${wid}" --stack "${wid}" || (yabai -m window ${wid} --toggle float && yabai -m window ${wid} --toggle float)
# yabai -m window weast --stack $(yabai -m query --windows --window | jq -r '.id')
# yabai -m window north --stack weast
# echo -n "$(yabai -m query --windows --window)"
# echo -n "WINDOWS: ${wid}"
# yabai -m window north --stack $(yabai -m query --windows --window | jq -r '.id')
# yabai -m window --stack next
# yabai -m window west --stack $(yabai -m query --windows --window | jq -r '.id') && echo $wid && echo $(yabai -m query --windows --window | jq -r '.id')
# yabai -m window "${wid}" --stack first