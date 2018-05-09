CACHEDIR="/var/cache/tmp/simplenote";
mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

URL="https://github.com/Automattic/simplenote-electron/$(wget https://github.com/Automattic/simplenote-electron/releases -O - | grep -Po releases/download/v[0-9.]{5}/Simplenote-linux-x64.[0-9.]{5}.tar.gz | head -n 1)"
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

tar -xzf "$FILE" -C "/opt"
mv /opt/Simplenote-linux-x64 /opt/simplenote

ln -sf "/opt/simplenote/Simplenote" "/usr/bin/Simplenote"

ICON="/opt/simplenote/"
cp "$ICON/Simplenote.png" "$ICON/simplenote.png"
mv -f "$ICON/simplenote.png" "/usr/share/icons/hicolor/64x64/apps"

sudo cat > /usr/local/share/applications/simplenote.desktop <<EOL
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Simplenote
Comment=Simplenote for Linux
Exec=Simplenote
Terminal=false
Icon=simplenote.png
Type=Application
StartupNotify=true
Keywords=note;simple;to-do
Categories=Accessories;Office;
EOL