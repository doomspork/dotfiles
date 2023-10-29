# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export PATH=$PATH:"/usr/local"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias df='cd ~/Projects/dotfiles; nvim README.md'
alias grbiaa='git rebase --interactive --autostash --autosquash'
alias ls='lsd --blocks permission,user,size,date,name'
alias mc='mix compile'
alias mt='mix test'

eval "$(/opt/homebrew/bin/rtx activate zsh)"
