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

ICON="/opt/firefox-developer/browser/chrome/icons/default"
cp "$ICON/default128.png" "$ICON/firefox-developer-icon.png"
mv -f "$ICON/firefox-developer-icon.png" "/usr/share/icons/hicolor/128x128/apps"

cat > /usr/local/share/applications/firefox-developer.desktop <<EOL
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Firefox Developer Edition
Comment=Firefox Developer Edition
Exec=firefox-developer
Icon=firefox-developer-icon.png
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