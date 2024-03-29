#!/bin/bash
trap 'clear' SIGINT
setxkbmap
cat ~/.aliases.txt | fzf | cut -d : -f 2- | xargs -I _ xdotool type  _
