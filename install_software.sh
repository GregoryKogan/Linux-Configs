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
sudo pacman -S --needed --noconfirm blueman
sudo pacman -S --needed --noconfirm pulsemixer
sudo pacman -S --needed --noconfirm pcmanfm-gtk3
sudo pacman -S --needed --noconfirm feh
sudo pacman -S --needed --noconfirm lxappearance-gtk3
sudo pacman -S --needed --noconfirm pavucontrol
sudo pacman -S --needed --noconfirm dmenu
sudo pacman -S --needed --noconfirm gparted
sudo pacman -S --needed --noconfirm lxsession-gtk3
sudo pacman -S --needed --noconfirm pamac
sudo pacman -S --needed --noconfirm neofetch
sudo pacman -S --needed --noconfirm xorg-xrandr
sudo pacman -S --needed --noconfirm python-pip

echo "##==##==##==INSTALLING PYTHON LIBS==##==##==##"
pip3 install -r python-requirements.txt

echo "##==##==##==INSTALLING YAY==##==##==##"
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

echo "##==##==##==INSTALLING AUR PACKAGES==##==##==##"
yay -S backlight_control;
yay -S snapd;
yay

echo "##==##==##==CONFIGURING SNAP==##==##==##"
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

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

# Starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
