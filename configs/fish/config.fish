# =============================================
# Fish shell config file
# location: ~/.config/fish
# Dependecies:
# 	- Starship prompt
#	(https://starship.rs/)
#	- Colorscript 
#	(https://gitlab.com/dwt1/shell-color-scripts) 	
# =============================================


# Enable Starship prompt
starship init fish | source


# Change greeting
set -g fish_greeting
colorscript random
echo 'Greetings master!'


### Aliases ###
alias rmi="rm -i"
alias mvi="mv -i"
alias gs="git status"
alias gb="git branch"
alias gc="git checkout"
alias gm="git merge"


### Custom functions ###

# Go to Fish shell (this) config
function mod_fish_config
	if test $argv
		$argv ~/.config/fish/config.fish
	else
		obgl subl ~/.config/fish/config.fish
	end
end

# Go to Starship prompt config
function mod_starship_config
	if test $argv
		$argv ~/.config/starship.toml
	else
		obgl subl ~/.config/starship.toml
	end
end

# Go to Alacritty terminal emulator config
function mod_alacritty_config
	if test $argv
		$argv ~/.config/alacritty/alacritty.yml
	else
		obgl subl ~/.config/alacritty/alacritty.yml
	end
end

# Go to Qtile wm config
function mod_qtile_config
	if test $argv
		$argv ~/.config/qtile/config.py
	else
		obgl subl ~/.config/qtile/config.py
	end
end

# Go to pacman config
function mod_pacman_config
	if test $argv
		sudo $argv /etc/pacman.conf
	else
		obgl sudo subl /etc/pacman.conf
	end
end

# Go to picom config
function mod_picom_config
	if test $argv
		$argv ~/.config/picom/picom.conf
	else
		obgl subl ~/.config/picom/picom.conf
	end
end


# Open app in backgroud without printing any logs to terminal
function obg
	echo "$argv &> /dev/null&"
	$argv &> /dev/null&;
end

# Open app in backgroud without printing app logs to terminal
function obgl
	echo "$argv &> /dev/null"
	$argv &> /dev/null;
end

# Create working files and open them in VSCode
function work_start
	cd ~/Desktop/
	mkdir work
	cd work/
	touch PythonSource.py
	touch CppSource.cpp
	cd ..
	subl work
	cd
end

# Delete all work files created in 'work_start'
function work_done
	cd ~/Desktop/
	rm -rf work
	cd
	pkill subl
end

# cd to work directory created in 'work_start'
function go_work
	cd ~/Desktop/work/
end
