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
sudo cp "$curpath/configs/config.fish" ~/.config/fish

# Starship
echo "Configuring Starship"
sudo cp "$curpath/configs/starship.toml" ~/.config

# Alacritty
echo "Configuring Alacritty"
sudo cp "$curpath/configs/alacritty.yml" ~/.config/alacritty


# Qtile
echo "Configuring Qtile"
sudo cp -r "$curpath/configs/qtile" ~/.config/


sudo rm curpath.txt;