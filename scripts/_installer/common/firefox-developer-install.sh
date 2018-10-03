#!/bin/bash
if [ -f /usr/bin/firefox-developer ]; then 
    rm /usr/bin/firefox-developer
    rm -rf /opt/firefox-developer
    rm /usr/share/applications/firefox-developer.desktop
fi
CACHEDIR="/var/cache/tmp/firefox-developer"
FILE="firefox-developer.tar.bz2"
URL="https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
DIR="/opt/firefox-developer"

[[ -d $CACHEDIR ]] || mkdir -p $CACHEDIR
[[ -f "$CACHEDIR/$FILE" ]] || wget -c "$URL" -O "$CACHEDIR/$FILE"

tar jxf "$CACHEDIR/$FILE" -C "/opt"
mv "/opt/firefox" $DIR

user=$(logname)
[[ -n $user ]] && chown -R $user $DIR
ln -sf "$DIR/firefox" "/usr/bin/firefox-developer"

xdg-icon-resource install --novendor --size 128 "/opt/firefox-developer/browser/chrome/icons/default/default128.png" "firefox-developer-icon"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

cat > /usr/local/share/applications/firefox-developer.desktop <<EOL
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Firefox Developer Edition
Comment=Firefox Developer Edition
Exec=firefox-developer
Icon=firefox-developer-icon
Terminal=false
Type=Application
StartupNotify=true
Keywords=firefox;dev;browser
Categories=Internet
Actions=new-window;new-private-window;

[Desktop Action new-window]
Name=Open a New Window
Exec=firefox-developer %u

[Desktop Action new-private-window]
Name=Open a New Private Window
Exec=firefox-developer --private-window %u
EOL