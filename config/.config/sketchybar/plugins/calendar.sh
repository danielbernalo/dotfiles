#!/bin/bash

sketchybar --set $NAME icon="$(date '+%a %d. %b')" label="$(date '+%H:%M') | $(TZ=Europe/Madrid date '+%H:%M')"
