# GUI scripts
## Description
GUI scripts for popular cli tools, based on dialog and fzf

## Scripts
- `a` - for managing apt packages
- `g` - for managing git repo
- `s` - for managing systemd services
- `r` - for running named commands from ~/.aliases.txt file
- `e` - open `lf` file manager
- `lk` - listen for keys above (except `r`)

See [Screenshots](#screenshots) section

## Installation
### Ubuntu/Debian-based
Download .deb package from [Releases](https://git.digitalstudium.com/digitalstudium/run/releases), then install it
```
sudo apt install ~/Downloads/gui-scripts_*.deb
```
### Other linux distros
Install dependencies: `fzf`, `dialog`, `xdotool`, `x11-xkb-utils`

Then clone this repo and copy all scripts to one of the PATH folder:
```
git clone https://git.digitalstudium.com/digitalstudium/gui-scripts.git
sudo cp gui-scripts/{a,g,s,r} /usr/local/bin/
```

## Screenshots
### s
![Choose service](./screenshots/2024-03-16-192529_1883x1000_scrot.png)
![Choose action](./screenshots/2024-03-16-192537_749x517_scrot.png)
### g
![Choose action](./screenshots/2024-03-16-191200_847x602_scrot.png)
![Add commit message](./screenshots/2024-03-16-191212_753x423_scrot.png)
### a
![Choose action](./screenshots/2024-03-16-191235_719x514_scrot.png)
![Choose package](./screenshots/2024-03-16-191251_1897x1003_scrot.png)
### r
![Choose command && run](./screenshots/2024-03-16-192622_1882x215_scrot.png)
