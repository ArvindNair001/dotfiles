if test $(which flatpak); then
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak install flathub org.nextcloud.Nextcloud \
    org.gimp.GIMP \
    org.telegram.desktop \
    com.github.fabiocolacio.marker \
    io.github.mmstick.FontFinder \
    com.googleplaymusicdesktopplayer.GPMDP \
    org.gottcode.FocusWriter 

    if [ "$OS" == "arch" ]; then
        flatpak install flathub com.visualstudio.code
    fi
fi