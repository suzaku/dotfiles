# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="Soliah"

# Example aliases
alias fili="ssh fili"
alias devup="cd $HOME/shire-in-vagrant && git pull && vagrant up --no-provision && vagrant ssh && vagrant suspend"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/Users/satoru/Library/Python/2.7/bin:/usr/local/bin:/sbin:/usr/sbin:/Users/satoru/bin:/usr/local/smlnj-110.75/bin/
export PATH=/Users/satoru/.cljr/bin:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export WORKON_HOME=~/.py_venv
source /usr/local/bin/virtualenvwrapper.sh

export EDITOR=/usr/bin/vim
