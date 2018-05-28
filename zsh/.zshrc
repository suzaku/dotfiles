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

f_func() {
    git --no-pager grep --color -n --heading --break -w "def $1"
}

clone_() {
    local raw_url=$1
    if [[ $raw_url == "git@*" ]] ; then
        local url=$1
    elif [[ ${raw_url:0:4} == "http" ]] ; then
        if [[ ${raw_url:0:5} == "https" ]] ; then
            local start=8
        else
            local start=7
        fi
        local repo="${raw_url:$start}"
        local arr
        arr=($(echo $repo | tr "/" " "))
        local url="git@${arr[1]}:${arr[2]}/${arr[3]}.git"
    fi
    git clone $url
}

alias gack="git --no-pager grep --color -n --heading --break"
alias vi=vim
alias -s git="git clone"
alias master="git co master"
alias rm_none_imgs="docker rmi $(docker images | grep '^<none>' | awk '{print $3}')"

if [ -e $HOME/.local_zshrc ];
then 
    source $HOME/.local_zshrc
fi

source $ZSH/oh-my-zsh.sh

PIPSI_PATH="$HOME/.local/bin"
export PATH="$HOME/.pyenv/bin:$PATH:/usr/local/opt/go/libexec/bin:$PIPSI_PATH:$GOPATH/bin"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export HISTFILESIZE=10000 # Record last 10,000 commands
export HISTSIZE=10000 # Record last 10,000 commands per session

setopt HIST_IGNORE_ALL_DUPS # http://zsh.sourceforge.net/Doc/Release/Options.html

[[ -s $HOME/.shonenjump.zsh ]] && source $HOME/.shonenjump.zsh

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

git_current_repo() {
    echo $(git remote show -n origin | grep "Push  URL" | sed "s/.*:\([^.]*\).git/\1/")
}

pr() {
    open https://gitlab.malong.com/$(git_current_repo)/merge_requests/new\?merge_request%5Bsource_branch%5D=$(git_current_branch)
}
