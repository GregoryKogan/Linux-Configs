APPS="""
alacritty
cmatrix
code
discord
firefox
fish
git
htop
inetutils
man-pages
nano
sublime-text
telegram-desktop
wget
xournalpp
yay
"""


sudo pacman -Syu
sudo pacman -S $APPS --noconfirm


# Colorscripts
git clone https://gitlab.com/dwt1/shell-color-scripts.git
cd shell-color-scripts
makepkg -cf
sudo pacman -U *.pkg.tar.zst
yay -S shell-color-scripts
cd ..
rm -rf shell-color-scripts

# Sublime text
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu sublime-text