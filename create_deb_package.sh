rm -rf tui-scripts*
mkdir -p tui-scripts_$(cat VERSION)-1/usr/local/bin
mkdir -p tui-scripts_$(cat VERSION)-1/DEBIAN

cat > tui-scripts_$(cat VERSION)-1/DEBIAN/control << EOL
Package: tui-scripts
Version: $(cat VERSION)-1
Section: base
Priority: optional
Architecture: amd64
Depends: fzf, dialog (>= 1.3), xdotool, x11-xkb-utils
Maintainer: Konstantin Shutkin <digitalstudium001@gmail.com>
Description: GUI scripts
 GUI scripts for popular cli tools, based on dialog and fzf
EOL


for script in a k g r s; do
  cp $script tui-scripts_$(cat VERSION)-1/usr/local/bin
done

dpkg-deb --build tui-scripts_$(cat VERSION)-1


