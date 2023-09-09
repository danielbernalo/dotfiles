#!/bin/bash
SPACE_LABELS=( $(yabai -m query --spaces | jq -re '.[].label') )
SPACE_NAME=( $(yabai -m query --spaces | jq -re '.[].index') )

# Destroy space on right click, focus space on left click.
# New space by left clicking separator (>)

sid=0
spaces=()
for i in "${!SPACE_NAME[@]}"
do
  sid=$(($i+1))

  space=(
    associated_space=$sid
    icon=${SPACE_LABELS[i]}
    icon.padding_left=10
    icon.padding_right=15
    padding_left=2
    padding_right=2
    label.padding_right=20
    icon.highlight_color=$RED
    label.font="sketchybar-app-font:Regular:13.0"
    label.background.height=16
    label.background.drawing=on
    label.background.color=$BACKGROUND_2
    label.background.corner_radius=8
    label.drawing=off
    script="$PLUGIN_DIR/space.sh"
    click_script="$PLUGIN_DIR/space.click.sh"

  )

  sketchybar --add space space.$sid left    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked
done

spaces=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=1
  background.drawing=on
)

# separator=(
#   icon=􀆊
#   icon.font="$FONT:Heavy:16.0"
#   padding_left=5
#   padding_right=5
#   label.drawing=off
#   associated_display=active
#   click_script='yabai -m space --create && sketchybar --trigger space_change'
#   icon.color=$WHITE
# )

sketchybar --add bracket spaces '/space\..*/' \
           --set spaces "${spaces[@]}"        
                                              # \
          #  --add item separator left          \
          #  --set separator "${separator[@]}"
