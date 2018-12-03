#!/bin/sh
# Give dmenu a list of all unicode characters to copy
# Shows notifigation on copy

grep -v "#" ~/.scripts/unicode.txt | dmenu -i -l 25 -fn Monospace-12 | awk -F ':' '{print $1}' | tr -d '\n' | xclip -selection clipboard

pgrep -x dunst > /dev/null && notify-send "$(xclip -o -selection clipboard) copied to clipboard."
