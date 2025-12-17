# TUI scripts
## Description
Scripts designed to enhance your productivity with CLI tools such as `apt`, `systemctl`, and `git`, utilizing `dialog` and `fzf`

## Scripts
- `a` - for managing `apt` packages
- `g` - for managing `git` repositories
- `s` - for managing systemd services

![Sripts in action](./images/scripts_in_action.gif)

## Installation
### Linux
Install dependencies: `fzf`, `dialog`, `xdotool`, `x11-xkb-utils`
e. g. on Debian/Ubuntu:
```bash
sudo apt install fzf dialog xdotool x11-xkb-utils -y
```
Then clone this repo and copy all scripts to one of the PATH folder:
```
git clone https://github.com/digitalstudium/tui-scripts.git
sudo cp tui-scripts/src/{a,g,s} /usr/local/bin/
```
