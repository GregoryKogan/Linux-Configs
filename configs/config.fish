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
		sudo $argv ~/.config/fish/config.fish
	else
		obgl sudo subl ~/.config/fish/config.fish
	end
end

# Go to Starship prompt config
function mod_starship_config
	if test $argv
		sudo $argv ~/.config/starship.toml
	else
		obgl sudo subl ~/.config/starship.toml
	end
end

# Go to Alacritty terminal emulator config
function mod_alacritty_config
	if test $argv
		sudo $argv ~/.config/alacritty/alacritty.yml
	else
		obgl sudo subl ~/.config/alacritty/alacritty.yml
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
	cd ~/'Рабочий стол/'
	mkdir work
	cd work/
	touch PythonSource.py
	touch CppSource.cpp
	subl .
	cd ~/
end

# Delete all work files created in 'work_start'
function work_done
	cd ~/'Рабочий стол/'
	rm -rf work
	cd ~/
	pkill subl
end

# cd to work directory created in 'work_start'
function go_work
	cd ~/'Рабочий стол/'work/
end

# Open MW-Insider project located in ~/Work/
function mw_start
	cd ~/Work/MW-Insider/Backend;
	obg pycharm .
	cd ../mobile_app;
	obg android-studio .
	cd ..
	clear
	git status
end

# Close MW-Insider project located in ~/Work/
function mw_done
	cd ~/Work/MW-Insider/;
	git add .;
	pkill java;
	cd;
	clear;
end
