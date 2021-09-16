# Linux-Configs

My personal linux configuration and customization files and scripts for automatically apply them and collect changes.

You absolutely should look through scripts and files and modify them for your personal needs!

### Usage
##### Clone repo and cd into it
```console
git clone https://github.com/GregoryKogan/Linux-Configs
cd Linux-Configs
```
##### Give scripts execute permissions
```console
sudo chmod +x install_software.sh
sudo chmod +x place_configs.sh
sudo chmod +x collect_configs.sh
```
##### Install software via script
```console
./install_software.sh
```
##### Place all config files in correct directories via script
```console
./place_configs.sh
```
#### If you changed your configs and want to update your Linux-Configs/configs folder
```console
./collect_configs.sh
```
Then you can commit and push it to your repo
