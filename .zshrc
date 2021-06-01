export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git docker)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:"/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/heroku/bin:$HOME/.cargo/bin"

export LANG=en_US.UTF-8
export EDITOR='nvim'

# gitignore.io helper
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# Add missing gdt alias
alias gdt='git difftool -d&'

alias up!='sudo docker-compose up -d'
alias down!='sudo docker-compose down'
alias bounce!='sudo docker-compose down && sudo docker-compose up -d'

alias ls='lsd --blocks permission,user,size,date,name'

function docktidy() { 
  sudo docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc:ro spotify/docker-gc
  sudo docker rm $(sudo docker ps -a -q)
  sudo docker rmi $(sudo docker images | grep "^<none>" | awk '{print $3}')
}

aws-profile(){
  export AWS_PROFILE="$1"
  export AWS_EB_PROFILE="$1"
  aws sts get-caller-identity | \
      jq -r --arg PROFILE "$AWS_PROFILE" '"Using AWS Account: "+ .Account + " (" + $PROFILE + ")"'
}

export GIT_EDITOR='/usr/bin/nvim'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.asdf/shims:$PATH"
