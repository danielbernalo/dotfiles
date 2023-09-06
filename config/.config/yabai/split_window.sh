#! /usr/bin/env sh

# make this file executable using:
#     chmod +x /path/to/this/script
# create a signal using: 
#     yabai -m signal --add event=window_created action="/path/to/this/script"

# get the window id of the newly created window
xx=$(yabai -m query --windows --window)
wid="$(echo $xx | jq -re ".id")"
#wid="${2}"

# if the split is horizontal, toggle it to vertical
#yabai -m query --windows --window "${wid}" | jq -re '.split == "horizontal"' \
#    && yabai -m window "${wid}" --toggle split

#echo "splited ${wid}"

yabai -m window "${wid}" --stack ${1}

echo "spplitewd $wid"

