function save_curpath(){
	touch curpath.txt;
	pwd > curpath.txt;	
}
save_curpath;
curpath=$(<curpath.txt);

echo "$curpath";


# Fish
echo "Collecting Fish config"
sudo cp ~/.config/fish/config.fish "$curpath/configs/fish"
sudo cp ~/.config/fish/conf.d/theme.fish "$curpath/configs/fish"

# Starship
echo "Collecting Starship config"
sudo cp ~/.config/starship.toml "$curpath/configs/starship"

# Alacritty
echo "Collecting Alacritty config"
sudo cp ~/.config/alacritty/alacritty.yml "$curpath/configs/alacritty"

# Qtile
echo "Collecting Qtile config"
sudo cp -r ~/.config/qtile "$curpath/configs"

# Xournal++
echo "Collecting Xournal++ config"
sudo cp ~/.config/xournalpp/toolbar.ini "$curpath/configs/xournalpp"

sudo rm curpath.txt;