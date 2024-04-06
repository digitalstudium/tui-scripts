#!/bin/bash
set -e
trap 'clear' SIGINT
cat > /tmp/.dialogrc << EOL
# Item color
tag_color = (BLACK,WHITE,ON)
EOL
set +ex
action=$(DIALOGRC=/tmp/.dialogrc dialog --stdout --erase-on-exit --menu "Choose the action for git" 10 40 0 'Add all && Commit && Push' 1 "Add all && Commit" 2 "Reset soft" 3 "Reset hard" 4 "Status" 5 "Clone submodules" 6)

#echo $action
#exit

if [[ $action == "Add all && Commit && Push" ]]; then 
  commit_message=$(DIALOGRC=/tmp/.dialogrc dialog --stdout --erase-on-exit --title "$action" --inputbox "Enter the commit message:" 8 40)
  git add .
  git commit -"m $commit_message"
  git push
elif [[ $action == "Add all && Commit" ]]; then 
  commit_message=$(DIALOGRC=/tmp/.dialogrc dialog --stdout --erase-on-exit --title "$action" --inputbox "Enter the commit message:" 8 40)
  git add . 
  git commit -"m $commit_message"
elif [[ $action == "Reset soft" ]]; then
  if DIALOGRC=/tmp/.dialogrc dialog --stdout --erase-on-exit --yesno "Do you wanna soft reset git?" 10 40; then
    git reset
  fi
elif [[ $action == "Reset hard" ]]; then 
  if DIALOGRC=/tmp/.dialogrc dialog --stdout --erase-on-exit --yesno "Do you wanna hard reset git?" 10 40; then
    git reset --hard
  fi
elif [[ $action == "Status" ]]; then 
  git status
elif [[ $action == "Clone submodules" ]]; then 
  git submodule update --init --recursive
fi
