echo "##==##==##==UPDATING PACKAGES==##==##==##"
sudo pacman -Syu;

echo "##==##==##==INSTALLING PACMAN PACKAGES==##==##==##"
sudo pacman -S --needed --noconfirm alacritty
sudo pacman -S --needed --noconfirm code
sudo pacman -S --needed --noconfirm discord
sudo pacman -S --needed --noconfirm firefox
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

echo "##==##==##==INSTALLING FONTS==##==##==##"
sudo pacman -S --needed --noconfirm ttf-anonymous-pro
sudo pacman -S --needed --noconfirm ttf-bitstream-vera
sudo pacman -S --needed --noconfirm ttf-caladea
sudo pacman -S --needed --noconfirm ttf-carlito
sudo pacman -S --needed --noconfirm ttf-cascadia-code
sudo pacman -S --needed --noconfirm ttf-cormorant
sudo pacman -S --needed --noconfirm ttf-croscore
sudo pacman -S --needed --noconfirm ttf-dejavu
sudo pacman -S --needed --noconfirm ttf-droid
sudo pacman -S --needed --noconfirm ttf-eurof
sudo pacman -S --needed --noconfirm ttf-fantasque-sans-mono
sudo pacman -S --needed --noconfirm ttf-fira-code
sudo pacman -S --needed --noconfirm ttf-fira-mono
sudo pacman -S --needed --noconfirm ttf-fira-sans
sudo pacman -S --needed --noconfirm ttf-font-awesome
sudo pacman -S --needed --noconfirm ttf-hack
sudo pacman -S --needed --noconfirm ttf-hactor
sudo pacman -S --needed --noconfirm ttf-hellvetica
sudo pacman -S --needed --noconfirm ttf-ibm-plex
sudo pacman -S --needed --noconfirm ttf-inconsolata
sudo pacman -S --needed --noconfirm ttf-jetbrains-mono
sudo pacman -S --needed --noconfirm ttf-joypixels
sudo pacman -S --needed --noconfirm ttf-lato
sudo pacman -S --needed --noconfirm ttf-liberation
sudo pacman -S --needed --noconfirm ttf-linux-libertine
sudo pacman -S --needed --noconfirm ttf-linux-libertine-g
sudo pacman -S --needed --noconfirm ttf-meslo-nerd-font-powerlevel10k
sudo pacman -S --needed --noconfirm ttf-monofur
sudo pacman -S --needed --noconfirm ttf-ms-fonts
sudo pacman -S --needed --noconfirm ttf-nerd-fonts-symbols-mono
sudo pacman -S --needed --noconfirm ttf-proggy-clean
sudo pacman -S --needed --noconfirm ttf-roboto
sudo pacman -S --needed --noconfirm ttf-roboto-mono
sudo pacman -S --needed --noconfirm ttf-ubuntu-font-family
sudo pacman -S --needed --noconfirm urxvt-resize-font-git
sudo pacman -S --needed --noconfirm xorg-mkfontscale
sudo pacman -S --needed --noconfirm adobe-source-han-sans-cn-fonts
sudo pacman -S --needed --noconfirm adobe-source-han-sans-jp-fonts
sudo pacman -S --needed --noconfirm adobe-source-han-sans-kr-fonts
sudo pacman -S --needed --noconfirm adobe-source-sans-fonts
sudo pacman -S --needed --noconfirm awesome-terminal-fonts
sudo pacman -S --needed --noconfirm font-manager-git
sudo pacman -S --needed --noconfirm gsfonts
sudo pacman -S --needed --noconfirm noto-fonts
sudo pacman -S --needed --noconfirm terminus-font

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
yay -S backlight_control
yay -S snapd
yay -S bibata-cursor-theme
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

# Sublime Text
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu sublime-text

# Gtk Dracula
git clone https://github.com/dracula/gtk.git
sudo mkdir ~/.themes
cd
sudo cp -r Linux-Configs/gtk/ ~/.themes
rm -rf Linux-Configs/gtk
cd Linux-Configs/

# Icons Dracula
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
unzip Dracula.zip
rm Dracula.zip
cd
sudo mkdir ~/.icons
sudo cp -r Linux-Configs/Dracula/ ~/.icons/
rm -rf Linux-Configs/Dracula/
cd Linux-Configs/