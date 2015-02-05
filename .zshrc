autoload -U compinit
compinit
setopt completeinword
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
autoload select-word-style
select-word-style shell
if [[ -x "`whence -p dircolors`" ]]; then
    eval `dircolors`
    alias ls='ls -F --color=auto'
else
    alias ls='ls -F'
fi

alias curl_paste="curl -F 'sprunge=<-' http://sprunge.us"
alias tad='tmux attach -d'
alias :q='exit'
alias ccat='pygmentize -g'

HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt incappendhistory 
setopt sharehistory
setopt extendedhistory
bindkey -e
setopt extendedglob
unsetopt caseglob

setopt interactivecomments # pound sign in interactive prompt
setopt auto_cd
autoload colors; colors


#export PS1="%{$fg[yellow]%}%n%{$reset_color%}@%{$fg[red]%}%m%{$fg[red]%}( %~ )%{$reset_color%}%# "
export PS1="%{%(#~$fg[green]~$fg[yellow])%}%n%{$reset_color%}@%{$fg[red]%}%m%{$fg[red]%}( %~ )%{$reset_color%}%# "

REPORTTIME=10

export TERM=screen-256color
export EDITOR=vim
export MPD_HOST=10.9.8.100
bindkey "5D" backward-word
bindkey "5C" forward-word

export OS_USERNAME OS_TENANT_NAME OS_AUTH_SYSTEM OS_PASSWORD OS_AUTH_URL OS_REGION_NAME OS_NO_CACHE

export PATH=$PATH:/home/pronto/.bin/:/home/pronto/tar/AWS-ElasticBeanstalk-CLI-2.6.4/eb/linux/python2.7/

function getcert () {
if [[ -z ${1} ]]
then
    echo 'please put in a url/ip to test'
    echo 'usage: % getcert google.com [port]'
    echo '[port] defaults to 443'
    return 1
fi
if [[ -z ${2} ]]
then
    local port=443
elif [[ ${2} == <-> ]]
then
    local port=${2}
else
    echo 'not an int'
    return 1
fi
echo "going to test ${1} on $port"
echo "HEAD / HTTP/1.1\n Host: ${1}:$port\n\n EOT\n" | openssl s_client -prexit -connect ${1}:$port
}

stty stop undef
stty start undef

