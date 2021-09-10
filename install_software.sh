install_packages(){
	echo "##==##==##==UPDATING PACKAGES==##==##==##"
	sudo pacman -Syu;

	echo "##==##==##==INSTALLING PACMAN PACKAGES==##==##==##"
	local packages=''

	# Apps
	packages+=' alacritty code discord firefox sublime-text-4 telegram-desktop xournalpp'

	# Utilities
	packages+=' cmatrix fish git htop inetutils man-pages nano wget yay blueman pulsemixer'
	packages+=' pcmanfm-gtk3 snapd feh lxappearance-gtk3 pavucontrol dmenu gparted lxsession-gtk3'

	echo "These packages are going to be installed:"
	echo "$packages"

	sudo pacman -Sy $packages;

	echo "##==##==##==INSTALLING AUR PACKAGES==##==##==##"
	# Backlight control
	yay -S backlight_control;

	echo echo "##==##==##==INSTALLING OTHER SOFTWARE==##==##==##"
	# Colorscripts
	git clone https://gitlab.com/dwt1/shell-color-scripts.git
	cd shell-color-scripts
	makepkg -cf
	pacman -U *.pkg.tar.zst
	yay -S shell-color-scripts
	cd ..
	rm -rf shell-color-scripts
}

install_packages