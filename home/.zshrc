# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# fix error during update: /bin/sh: /tools/upgrade.sh: No such file or directory
## autoload -Uz promptinit
## promptinit
## prompt walters

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# export ZSH_THEME="random"
# export ZSH_THEME="afowler"
export ZSH_THEME="steeef-johan"

### From Jeroen's zshrc file
source ~/.rvm/scripts/rvm

### Fix SVN warning svn: warning: cannot set LC_CTYPE locale
export LC_ALL=C

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git)
plugins=(rails git textmate ruby rvm zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/local/bin

### VERY IMPORTANT THAT .rvm IS BEFORE THE PATH (otherwise rvm won't load the correct default on console start)
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
PATH=/Users/Johan/.rvm/gems/ruby-1.9.3-p327@rails3tutorial2ndEd/bin:/Users/Johan/.rvm/gems/ruby-1.9.3-p327@global/bin:/Users/Johan/.rvm/rubies/ruby-1.9.3-p327/bin:$HOME/.rvm/bin:/usr/local/mysql/bin:$PATH # Add RVM to PATH for scripting

# Stop it from  correcting
unsetopt correct_all

# for gynzy server_config
export RAILS_SERVER_CONFIG_HOST='johan.gynzy.net'

# Command aliases
alias home="cd ~"
alias githome="cd ~/git/sites"
alias svnhome="cd ~/svn/gynzy"
alias htauthhome="cd /Library/WebServer"
alias sublh="subl /etc/hosts"

alias bx='bundle exec'
alias gs='git status'
alias gf='git fetch origin -p'
alias gft='git fetch origin -t'

