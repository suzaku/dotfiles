# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="Soliah"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

export GOPATH=$HOME/go

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/bin:/sbin:/usr/sbin
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export WORKON_HOME=~/.py_venv

export EDITOR=/usr/local/bin/vim

dev() {
    local vagrant_path=${1:-$PWD}
    cd $vagrant_path;
    vagrant up --no-provision;
    #sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@192.168.33.10 && vagrant suspend;
    vagrant ssh && vagrant suspend;
}

alias gack="git --no-pager grep --color -n --heading --break"
alias vi=vim

export PY_PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin/"

if [ -e $HOME/.local_zshrc ];
then 
    source $HOME/.local_zshrc
fi

source $ZSH/oh-my-zsh.sh

tmux has-session 2> /dev/null && [ -z $TMUX ] && [ -z $(tmux list-clients) ] && tmux attach
