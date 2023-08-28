#!/bin/bash
set -a

xx=$(yabai -m query --windows --window)
ss=$(yabai -m query --spaces --space)

YABAI_WINDOW_ID="$(echo $xx | jq -re ".id")"
YABAI_SPACE_ID="$(echo $xx | jq -re ".space")"

WINDOWS_ARRAY=$(yabai -m query --windows --space 2 \
| jq -re 'map(select(."is-minimized"==false and ."is-floating"==false))')

# Get the number of windows on the current space
NUMBER_OF_WINDOWS=$(echo $WINDOWS_ARRAY | jq -re 'length')
echo "NUMBER_OF_WINDOWS: ${NUMBER_OF_WINDOWS}"

if [ "$NUMBER_OF_WINDOWS" -le "4" ]; then
   yabai -m window $YABAI_WINDOW_ID --insert stack
   echo $ss | jq -re '.windows | join(" ")' > $HOME/.config/yabai/YABAI_INDEX_STACK_WINDOW_$YABAI_SPACE_ID
else
   dir=( $(cat $HOME/.config/yabai/YABAI_INDEX_STACK_WINDOW_$YABAI_SPACE_ID) )
   dir_index=$((NUMBER_OF_WINDOWS%4))
   if [ "${dir_index}" = "-1" ]; then
      dir_index=0;
   fi

   if [ "${dir_index}" -ge "4" ]; then
      dir_index=3;
   fi

   yabai -m window $YABAI_WINDOW_ID --stack ${dir[$dir_index]]}
   echo "spliter $dir_index  ${dir[$dir_index]}"

fi
