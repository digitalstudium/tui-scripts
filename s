#!/bin/bash
set -e
cat > /tmp/.dialogrc << EOL
# Item color
tag_color = (BLACK,WHITE,ON)
EOL
service=$(systemctl list-units --type service --all --plain --quiet | awk '{ print $1 }' | fzf)
set +ex
action=$(DIALOGRC=/tmp/.dialogrc dialog --stdout --erase-on-exit --menu "Choose the action for $service" 10 40 0 "Status" 1 "Start" 2 "Stop" 3 "Disable" 4 "Enable" 5)


if [ ! -z $action ]; then 
  sudo systemctl ${action,,} $service
fi
