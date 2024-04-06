#!/bin/bash
trap 'clear' SIGINT
setxkbmap
cat ~/.aliases.txt | fzf | cut -d : -f 2- | sed s/\ // | (stty -F /dev/tty -echo; xargs -0 -I _ xdotool type --delay 0 _; stty -F /dev/tty echo) && xdotool key --delay 0 KP_Enter
