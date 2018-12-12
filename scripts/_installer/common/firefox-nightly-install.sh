#!/bin/bash
if [ -f /usr/bin/firefox-nightly ]; then
    echo "Removing ...."
    rm /usr/bin/firefox-nightly
    rm -rf /opt/firefox-nightly
    rm /usr/share/applications/firefox-nightly.desktop
fi
CACHEDIR="/var/cache/tmp/firefox-nightly"
FILE="firefox-nightly.tar.bz2"
URL="https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US"
DIR="/opt/firefox-nightly"

[[ -d $CACHEDIR ]] || mkdir -p $CACHEDIR
[[ -f "$CACHEDIR/$FILE" ]] || wget -c "$URL" -O "$CACHEDIR/$FILE"

tar jxf "$CACHEDIR/$FILE" -C "/opt"
mv "/opt/firefox" $DIR
sleep 1.0

#user=$(logname)
[[ -n $CURRENT_USER ]] && chown -R $CURRENT_USER $DIR
ln -sf "$DIR/firefox" "/usr/bin/firefox-nightly"

xdg-icon-resource install --novendor --size 128 "/opt/firefox-nightly/browser/chrome/icons/default/default128.png" "firefox-nightly"
gtk-update-icon-cache -f -t /usr/share/icons/hicolor

cat << EOF | tee /usr/share/applications/firefox-nightly.desktop
[Desktop Entry]
Name=Firefox Nightly
GenericName=Web Browser
Comment=Firefox Nightly Edition
Exec=firefox-nightly %u
Icon=firefox-nightly
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
StartupWMClass=Nightly
Keywords=web;internet;browser;
Categories=Network,WebBrowser;
Actions=new-window;new-private-window;

[Desktop Action new-window]
Name=New Window
Exec=firefox-nightly --new-window %u

[Desktop Action new-private-window]
Name=New Private Window
Exec=firefox-nightly --private-window %u
EOF