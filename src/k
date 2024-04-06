#!/bin/bash
set -e
trap 'clear' SIGINT
cat > /tmp/.dialogrc << EOL
# Item color
tag_color = (BLACK,WHITE,ON)
EOL
namespace=$(kubectl get ns --no-headers | awk '{ print $1 }' | fzf --multi --cycle --reverse --preview 'kubectl get pods -o wide -n {1}')
resource=$(DIALOGRC=/tmp/.dialogrc dialog --stdout --erase-on-exit --menu "Choose resource in $namespace" 10 40 0 "Pods" 1 "Services" 2 "Ingress" 3 "Secrets" 4)
set +ex


if [ "$resource" = "Pods" ]; then 
  pod=$(kubectl -n $namespace get pods --no-headers | awk '{ print $1 }' | fzf --multi --cycle --reverse --preview "kubectl get pod -n $namespace {1} -o yaml")
  if [ ! -z "$pod" ]; then 
    action=$(DIALOGRC=/tmp/.dialogrc dialog --stdout --erase-on-exit --menu "Choose action for $pod in $namespace" 10 40 0 "Logs" 1 "Describe pod" 2 "Exec -it" 3 "Delete pod" 4)
  fi
  if [ ! -z "$action" ]; then
    xdotool type --delay 0 "kubectl -n $namespace ${action,,} $pod" && xdotool key --delay 0 KP_Enter
  fi
elif [ "$resource" = "Services" ]; then 
  svc=$(kubectl -n $namespace get svc --no-headers | awk '{ print $1 }' | fzf --multi --cycle --reverse --preview "kubectl get svc -n $namespace {1} -o yaml")
  if [ ! -z "$svc" ]; then 
    action=$(DIALOGRC=/tmp/.dialogrc dialog --stdout --erase-on-exit --menu "Choose action for $pod in $namespace" 10 40 0 "Get endpoints" 1 "Edit service" 2)
  fi
  if [ ! -z "$action" ]; then
    xdotool type --delay 0 "kubectl -n $namespace ${action,,} $svc" && xdotool key --delay 0 KP_Enter
  fi
fi	


