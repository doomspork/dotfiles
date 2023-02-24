export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:"/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

export LANG=en_US.UTF-8
export EDITOR='nvim'

# gitignore.io helper
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# Add missing gdt alias
alias gdt='git difftool &'

alias up!='docker-compose up -d'
alias down!='docker-compose down'
alias bounce!='docker-compose down && sudo docker-compose up -d'

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

export GIT_EDITOR='/usr/local/bin/nvim'

if [ -f '/Users/seancallan/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/seancallan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/seancallan/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/seancallan/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(/usr/local/bin/rtx activate zsh)"
