if test $(which flatpak) then
    flatpak-install flathub org.nextcloud.Nextcloud \
    org.gimp.GIMP \
    org.telegram.desktop \
    com.github.fabiocolacio.marker \
    io.github.mmstick.FontFinder \
    com.googleplaymusicdesktopplayer.GPMDP \
    flathub org.gottcode.FocusWriter 

    if [ "$OS" == "arch" ]; then
        flatpak-install flathub com.visualstudio.code
    fi
fi