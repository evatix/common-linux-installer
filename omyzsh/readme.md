# Install Notes

## Install Apt

yes | sudo apt-get install open-vm-tools build-essential libssl-dev
yes | sudo apt install git git-lfs ansible wget curl openssh net-tools 
yes | sudo apt install zsh make

## Themes

```notes
ZSH_THEME="agnoster"
ZSH_THEME="amuse"
ZSH_THEME="avit"
ZSH_THEME="bureau"
ZSH_THEME="kardan"


plugins=(zsh-autosuggestions)

```


#### Auto Suggestion

- <https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md>
- `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
- Clone this repository into $ZSH_CUSTOM/plugins (by default ~/.oh-my-zsh/custom/plugins)

`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

- Add the plugin to the list of plugins for Oh My Zsh to load `(inside ~/.zshrc)`:

- `vim ~/.zshrc` and then add or update code
- [Oh MyZSH Theme](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)
- add this to `vim ~/.zshrc`
`alias clear_history='echo "" > ~/.zsh_history & exec $SHELL -l'`
- `source ~/.zshrc`
Default
`ZSH_THEME="robbyrussell"`

