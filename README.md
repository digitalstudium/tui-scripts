# TUI scripts
## Description
Terminal user interface scripts for popular cli tools such as apt, systemctl, git, kubectl. Based on dialog and fzf 

## Scripts
- `a` - for managing apt packages
- `g` - for managing git repo
- `s` - for managing systemd services
- `k` - for managing kubernetes (depends on kubectl)
- `r` - for running named commands from ~/.aliases.txt file

![Sripts in action](./images/scripts_in_action.gif)

## Installation
### Ubuntu/Debian-based
Download .deb package from [Releases](https://git.digitalstudium.com/digitalstudium/run/releases), then install it
```
sudo apt install ~/Downloads/tui-scripts_*.deb
```
### Other linux distros
Install dependencies: `fzf`, `dialog`, `xdotool`, `x11-xkb-utils`

Then clone this repo and copy all scripts to one of the PATH folder:
```
git clone https://git.digitalstudium.com/digitalstudium/tui-scripts.git
sudo cp tui-scripts/src/{a,g,s,r,k} /usr/local/bin/
```
