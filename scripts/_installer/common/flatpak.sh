if command -v  flatpak >/dev/null 2>&1; then
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install -y flathub org.telegram.desktop \
    com.axosoft.GitKraken \
    io.github.mmstick.FontFinder \
    com.googleplaymusicdesktopplayer.GPMDP \
    org.gottcode.FocusWriter
    
    #net.ankiweb.Anki
    #org.nextcloud.Nextcloud \

    #if [ "$OS" == "arch" ]; then
        #flatpak install flathub com.visualstudio.code
    #fi
fi
