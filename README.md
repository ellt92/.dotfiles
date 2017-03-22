## Elliott's Dotfiles

### (Mac) Install Brew
`xcode-select --install`

`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`


### Install zsh and oh-my-zsh
Mac - `brew install zsh`

Linux - `apt-get install zsh`

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

### Install nvm
Mac - `brew install nvm`

Linux - `apt-get install nvm`

`mkdir ~/.nvm`

add the following to ~/.zshrc:
```
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
```
`nvm install 6.0`

`nvm alias default 6.0`

### Install oh-my-zsh

`git clone https://github.com/carloscuesta/materialshell`

`cp clonedir/materialshell/zsh/materialshell.zsh-theme ~/.oh-my-zsh/themes/`

Add the following to ~/.zshrc:
```
ZSH_THEME="materialshell-oceanic"
```

### Vim Setup
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

`git clone https//github.com/ellt92/.dotfiles ~/`

Inside ~/ run the following:

`ln -s ./.dotfiles/.vimrc ./.vimrc`

`vim ~/.vimrc`

Inside vim run:

`:PluginInstall`
