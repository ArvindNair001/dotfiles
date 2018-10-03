if command -v  flatpak >/dev/null 2>&1; then
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install -y flathub org.nextcloud.Nextcloud \
    net.ankiweb.Anki \
    com.axosoft.GitKraken \
    org.telegram.desktop \
    com.github.fabiocolacio.marker \
    io.github.mmstick.FontFinder \
    com.googleplaymusicdesktopplayer.GPMDP \
    org.gottcode.FocusWriter 

    #if [ "$OS" == "arch" ]; then
        #flatpak install flathub com.visualstudio.code
    #fi
fi