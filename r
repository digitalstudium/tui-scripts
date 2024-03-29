#!/bin/bash
trap 'clear' SIGINT
setxkbmap
cat ~/.aliases.txt | fzf | cut -d : -f 2- | (stty -F /dev/tty -echo; xargs -0 -I _ xdotool type --delay 0 _; stty -F /dev/tty echo) && xdotool key Return
