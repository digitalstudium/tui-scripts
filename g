#!/bin/bash
set -e
cat > /tmp/.dialogrc << EOL
# Item color
tag_color = (BLACK,WHITE,ON)
EOL
set +ex
action=$(DIALOGRC=/tmp/.dialogrc dialog --stdout --erase-on-exit --menu "Choose the action for git" 10 40 0 'Add all && Commit && Push' 1 "Add all" 2 "Commit" 3 "Push" 4)

#echo $action
#exit

if [[ $action == "Add all && Commit && Push" ]]; then 
  git add .
  commit_message=$(DIALOGRC=/tmp/.dialogrc dialog --stdout --erase-on-exit --title "$action" --inputbox "Enter the commit message:" 8 40)
  git commit -"m $commit_message"
  git push
elif [[ $action == "Add all" ]]; then 
  git add .
elif [[ $action == "Commit" ]]; then 
  commit_message=$(DIALOGRC=/tmp/.dialogrc dialog --stdout --erase-on-exit --title "$action" --inputbox "Enter the commit message:" 8 40)
  git commit -"m $commit_message"
elif [[ $action == "Push" ]]; then 
  git push
fi
