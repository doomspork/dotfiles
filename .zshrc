export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(bundler chruby git osx ruby docker)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:"/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/heroku/bin"

export LANG=en_US.UTF-8

export EDITOR='mvim'

# gitignore.io helper
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# Add missing gdt alias
alias gdt='git difftool'

alias fs='foreman start'

function release() {
  docker build --tag=elixir-build --build-arg ssh_prv_key="$(cat ~/.ssh/id_rsa)" --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)" --squash . 
  docker run -v $(pwd)/releases:/app/_build/prod/rel --env-file $1 elixir-build mix release --env=prod 
}

function docktidy() { 
  docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc:ro spotify/docker-gc
  docker rm $(docker ps -a -q)
  docker rmi $(docker images | grep "^<none>" | awk '{print $3}')
}

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-2.3

if [[ -s "$HOME/.kiex/scripts/kiex" ]]; then
  source "$HOME/.kiex/scripts/kiex"
  kiex use 1.4.4
fi

export GIT_EDITOR='/usr/local/bin/mvim -g -f'
eval "$(thefuck --alias)"
