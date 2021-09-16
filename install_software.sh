echo "##==##==##==UPDATING PACKAGES==##==##==##"
sudo pacman -Syu;

echo "##==##==##==INSTALLING PACMAN PACKAGES==##==##==##"
sudo pacman -S --needed --noconfirm alacritty
sudo pacman -S --needed --noconfirm code
sudo pacman -S --needed --noconfirm discord
sudo pacman -S --needed --noconfirm firefox
sudo pacman -S --needed --noconfirm sublime-text-4
sudo pacman -S --needed --noconfirm telegram-desktop
sudo pacman -S --needed --noconfirm xournalpp
sudo pacman -S --needed --noconfirm cmatrix
sudo pacman -S --needed --noconfirm fish
sudo pacman -S --needed --noconfirm git
sudo pacman -S --needed --noconfirm htop
sudo pacman -S --needed --noconfirm inetutils
sudo pacman -S --needed --noconfirm man-pages
sudo pacman -S --needed --noconfirm nano
sudo pacman -S --needed --noconfirm wget
sudo pacman -S --needed --noconfirm rofi
sudo pacman -S --needed --noconfirm yay
sudo pacman -S --needed --noconfirm blueman
sudo pacman -S --needed --noconfirm pulsemixer
sudo pacman -S --needed --noconfirm pcmanfm-gtk3
sudo pacman -S --needed --noconfirm snapd
sudo pacman -S --needed --noconfirm feh
sudo pacman -S --needed --noconfirm lxappearance-gtk3
sudo pacman -S --needed --noconfirm pavucontrol
sudo pacman -S --needed --noconfirm dmenu
sudo pacman -S --needed --noconfirm gparted
sudo pacman -S --needed --noconfirm lxsession-gtk3

echo "##==##==##==INSTALLING AUR PACKAGES==##==##==##"
yay -S backlight_control;

echo "##==##==##==INSTALLING SNAP PACKAGES==##==##==##"
sudo snap install snap-store

echo echo "##==##==##==INSTALLING OTHER SOFTWARE==##==##==##"
# Colorscripts
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
makepkg -cf
pacman -U *.pkg.tar.zst
yay -S shell-color-scripts
cd ..
rm -rf shell-color-scripts
