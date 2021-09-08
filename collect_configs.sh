function save_curpath(){
	touch curpath.txt;
	pwd > curpath.txt;	
}
save_curpath;
curpath=$(<curpath.txt);

echo "$curpath";


# Fish
echo "Collecting Fish config"
sudo cp ~/.config/fish/config.fish "$curpath/configs/"

# Starship
echo "Collecting Starship config"
sudo cp ~/.config/starship.toml "$curpath/configs/"

# Alacritty
echo "Collecting Alacritty config"
sudo cp ~/.config/alacritty/alacritty.yml "$curpath/configs/"


# Qtile
echo "Collecting Qtile config"
sudo cp -r ~/.config/qtile "$curpath/configs/"

sudo rm curpath.txt;