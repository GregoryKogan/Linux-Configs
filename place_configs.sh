function save_curpath(){
	touch curpath.txt;
	pwd > curpath.txt;	
}
save_curpath;
curpath=$(<curpath.txt);

echo "$curpath";


# Fish
echo "Configuring Fish"
sudo mkdir ~/.config/fish
sudo mkdir ~/.config/fish/conf.d
sudo cp "$curpath/configs/fish/config.fish" ~/.config/fish
sudo cp "$curpath/configs/fish/theme.fish" ~/.config/fish/conf.d

# Starship
echo "Configuring Starship"
sudo cp "$curpath/configs/starship/starship.toml" ~/.config

# Alacritty
echo "Configuring Alacritty"
sudo mkdir ~/.config/alacritty
sudo cp "$curpath/configs/alacritty/alacritty.yml" ~/.config/alacritty

# Qtile
echo "Configuring Qtile"
sudo cp -r "$curpath/configs/qtile" ~/.config/

# Xournal++
echo "Configuring Xournal++"
sudo mkdir ~/.config/xournalpp
sudo cp -r "$curpath/configs/xournalpp/toolbar.ini" ~/.config/xournalpp

# Rofi
echo "Configuring Rofi"
sudo cp -r "$curpath/configs/rofi" ~/.config/

echo "Placing images"
sudo mkdir ~/Pictures/Wallpapers
sudo cp "$curpath/images/AnimeGirls.jpg" ~/Pictures
sudo cp "$curpath/images/Wallpapers/dracula.png" ~/Pictures/Wallpapers

sudo rm curpath.txt;