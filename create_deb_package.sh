rm -rf gui-scripts*
mkdir -p gui-scripts_$(cat VERSION)-1/usr/local/bin
mkdir -p gui-scripts_$(cat VERSION)-1/DEBIAN

cat > gui-scripts_$(cat VERSION)-1/DEBIAN/control << EOL
Package: gui-scripts
Version: $(cat VERSION)-1
Section: base
Priority: optional
Architecture: amd64
Depends: fzf, dialog (>= 1.3), xdotool, x11-xkb-utils
Maintainer: Konstantin Shutkin <digitalstudium001@gmail.com>
Description: GUI scripts
 GUI scripts for popular cli tools, based on dialog and fzf
EOL


for script in a f g lk r s; do
  cp $script gui-scripts_$(cat VERSION)-1/usr/local/bin
done

dpkg-deb --build gui-scripts_$(cat VERSION)-1


