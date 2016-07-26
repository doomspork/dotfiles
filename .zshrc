export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(bundler chruby git osx ruby docker)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:"/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/heroku/bin"

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# gitignore.io helper
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# Add missing gdt alias
alias gdt='git difftool'

alias fs='foreman start'

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-2.3

if [[ -s "$HOME/.kiex/scripts/kiex" ]]; then
  source "$HOME/.kiex/scripts/kiex"
  kiex use 1.3.2
fi

export GIT_EDITOR='/usr/local/bin/mvim -g -f'
