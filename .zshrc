# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Aliases #
alias myserver="ssh root@178.62.126.227"
alias tmux="TERM=screen-256color-bce tmux"
alias gbd="git branch -D"
alias vim="nvim"
alias ys="yarn start"
alias yt="yarn test"
alias yj="yarn jest"
alias yl="yarn lint"
alias yb="yarn build"

# Exports #
export ANDROID_HOME=~/Library/Android/sdk
export GRADLE_HOME=/usr/local/opt/gradle-2.12
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home

# Paths #
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/ethompson/.nvm/versions/node/v8.0.0/bin"
export PYTHONPATH=$PYTHONPATH:/Library/Python/2.7/site-packages

# Themeing #
ZSH_THEME="materialshell"

# Plugins #
plugins=(git)

# Now load oh my zsh (Before loading any modules)#
source $ZSH/oh-my-zsh.sh

# Z - Jump around #
 . /usr/local/etc/profile.d/z.sh

#
# Load virtualenvwrapper #
venvwrap="virtualenvwrapper.sh"
/usr/bin/which -s $venvwrap
if [ $? -eq 0 ]; then
    venvwrap=`/usr/bin/which $venvwrap`
        source $venvwrap
        fi

        PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Load NVM #
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
