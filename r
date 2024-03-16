#!/bin/bash
setxkbmap
cat ~/.aliases.txt | fzf | cut -d : -f 2- | xargs -I _ xdotool type  _
