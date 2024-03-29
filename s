#!/bin/bash
set -e
trap 'clear' SIGINT
cat > /tmp/.dialogrc << EOL
# Item color
tag_color = (BLACK,WHITE,ON)
EOL
service=$(systemctl list-units --type service --all --plain --quiet | awk '{ print $1 }' | fzf --multi --cycle --reverse --preview 'systemctl status {1}')
set +ex
action=$(DIALOGRC=/tmp/.dialogrc dialog --stdout --erase-on-exit --menu "Choose the action for $service" 10 40 0 "Start" 1 "Stop" 2 "Disable" 3 "Enable" 4)


if [ ! -z $action ]; then 
  sudo systemctl ${action,,} $service
fi
