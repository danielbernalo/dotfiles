#!/bin/bash
#sleep 8
SPACE_LABELS=( $(yabai -m query --spaces | jq -re '.[].label') )
SPACE_NAME=( $(yabai -m query --spaces | jq -re '.[].index') )

export SPACE_CLICK_SCRIPT="yabai -m space --focus \$SID 2> /dev/null"

sid=0
spaces=()
for i in "${!SPACE_NAME[@]}"
do
  sid=$(($i+1))

  space=(
    associated_space=$sid
    icon=${SPACE_LABELS[i]}
    icon.color=0xff939ab7
    icon.padding_left=10
    icon.padding_right=15
    icon.y_offset=-3                                                 \
    label.y_offset=-3 
    padding_left=2
    padding_right=2
    label.padding_right=20
    icon.highlight_color=0xffff9ab7 
    label.font="sketchybar-app-font:Regular:13.0"
    label.background.height=40
    label.background.drawing=on
    label.background.color=0x90494d64
    label.background.corner_radius=4
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
  background.border_color=0x90494d64
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

YABAI_SPACES="$(yabai -m query --spaces)"

#args=()
#while read -r index label
#do
#  args+=(--set space.${index} icon="${label}")
#done <<< "$(yabai -m query --spaces | jq -r '.[] | [.index, .label] | @sh')"

#sketchybar "${args[@]}"
