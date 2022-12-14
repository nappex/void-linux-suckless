sudo xbps-install -Suv
# dependecies to install dwm
sudo xbps-install base-devel libX11-devel libXft-devel libXinerama-devel freetype-devel fontconfig-devel

# set zsh as default
sudo xbps-install -S zsh
sudo chsh -s /bin/zsh # for root
# sudo chsh -s $(which zsh)
chsh -s /bin/zsh # for current user

# install vim
sudo xbps-install -S vim

# install qutebrowser
sudo xbps-install qutebrowser 

# WARNING before install dwm you have to change paths in file config.mk
# from X11INC = /usr/X11R6/include to X11INC = /usr/include/X11
# from X11LIB = /usr/X11R6/lib to X11LIB = /usr/lib/X11
git clone https://git.suckless.org/dwm $HOME/.suckless/dwm

cd $HOME/.suckless/dwm
sudo make
sudo make clean install
echo "exec dwm" > $HOME/.xinitrc

git clone https://git.suckless.org/dmenu $HOME/.suckless/dmenu
cd $HOME/.suckless/dmenu
sudo make
sudo make clean install

git clone https://git.suckless.org/st $HOME/.suckless/st
cd $HOME/.suckless/st
sudo make
sudo make clean install

git clone https://git.suckless.org/st $HOME/.suckless/slstatus
cd $HOME/.suckless/slstatus
sudo make
sudo make clean install
sed -i '1i slstatus &' $HOME/.xinitrc

# install feh - light & fast image viewer and set up wallpapers
sudo xbps-install feh

# Set wallpaper
mkdir -p $HOME/Pictures/wallpapers
curl -o ~/julian-calle-practice.jpg https://cdnb.artstation.com/p/assets/images/images/007/692/529/4k/julian-calle-practice2.jpg?1507877011 
feh --bg-fill $HOME/Pictures/wallpapers/julian-calle-practice.jpg
sed -i '1i feh --bg-fill $HOME/Pictures/wallpapers/julian-calle-practice.jpg' $HOME/.xinitrc

# set wallpaper when is invoked startx by script
# echo "feh --bg-fill $HOME/Pictures/wallpapers/julian-calle-practice.jpg" > $HOME/.set_wallpaper
# chmod u+x $HOME/.set_wallpaper
# sed -i '1i $HOME/.set_wallpaper' $HOME/.xinitrc

