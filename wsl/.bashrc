# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)} \[\033[01;32m\]\w\[\033[00m\] \$ '
    PS1='\[\e]0;\u@\h: \w\a\]\[\033[;32m\]┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)\[\033[;32m\])}(\[\033[1;34m\]Ubuntu\[\033[;32m\])-[\[\033[0;1m\]\w\[\033[;32m\]]\n\[\033[;32m\]└─\[\033[1;34m\]\$\[\033[0m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# ================CUSTOM======================

bind 'set bell-style none'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'

bind -m vi-command '"ciw":"1bcw"'
bind -m vi-command '"diw":"1bdw"'
bind -m vi-command '"yiw":"1byw"'
bind -m vi-command '"ciW":"1bcW"'
bind -m vi-command '"diW":"1bdW"'
bind -m vi-command '"yiW":"1byW"'

export PROMPT_COMMAND='history -a'
export GOPATH="/home/kaushik/go"

alias sb="source ~/.bashrc"
alias ..="cd .."
alias ...="cd ../.."
alias vi="nvim"
alias svi="sudo nvim"
alias azure="ssh -i ~/.keys/key.pem kaushik@kaushik.me"

alias notes="vi ~/stuff/notes.txt"
alias bnotes="vi ~/stuff/bnotes.txt"
alias snotes="sudo nvim ~/stuff/snotes.txt"
alias gnotes="vi ~/stuff/gnotes.txt"
alias dnotes="vi ~/stuff/dnotes.txt"
alias todo="vi ~/stuff/todo.txt"
alias htodo="vi ~/stuff/htodo.txt"
alias ideas="vi ~/stuff/ideas.txt"

alias zz="fg"
alias lslt="ls -lt | head"
alias jnb="jupyter-notebook"
alias tunnel="autossh -M 0 -fN -R 0.0.0.0:4444:localhost:22 -v -i ~/.keys/key.pem kaushik@kaushik.me"
# alias hashcat="/mnt/c/Users/kaush/Documents/hashcat-6.2.5/hashcat.bin"
alias colours="bash /home/kaushik/stuff/code/utilities/printcols.sh"
alias alaconf="vi /mnt/c/Users/kaush/AppData/Roaming/alacritty/alacritty.yml"
alias wshut="wsl.exe --shutdown"
alias wsl="wsl.exe"
alias recon="~/tools/recon/ultimate_recon.sh"
alias bucket="~/tools/Bucket-Flaws/bucketflaws.sh"
alias open="wslview"
alias whatweb="~/stuff/programs/WhatWeb/whatweb"
alias pi="ssh pi@pi.kaushik.me -p 2222"
alias locpi="ssh pi@raspberrypi.local"
alias sync="open https://dcu-ie.zoom.us/j/97923416879?pwd=VmFDUWFkT2hmSzVkOXlSNERadG0wdz09"
alias mount="sudo mount -t drvfs d: /mnt/d"

alias terminate="wsl --terminate Ubuntu"
alias kterminate="wsl --terminate kali-linux"
alias kali="kali.exe"

alias k="kubectl"
source <(kubectl completion bash)
complete -F __start_kubectl k

alias chrome="wslview chrome"
alias whatsapp="wslview whatsapp://"
alias lens="wslview lens://"
alias discord="wslview discord://"
alias slack="wslview slack"
alias spotify="wslview spotify"
alias explore="explorer.exe"
alias lms="wslview https://lms.vit.ac.in"

. /usr/share/autojump/autojump.sh
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
complete -W "\$(gf -list)" gf

export NVM_DIR="$HOME/.nvm"
export WINHOME="/mnt/c/Users/kaush"
export DOWNLOADS="/mnt/c/Users/kaush/Downloads"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'

function makepost(){
    cp ~/stuff/site/posts/template.html ~/stuff/site/posts/$1.html
    sleep 1
    chmod 666 ~/stuff/site/posts/$1.html
    touch ~/stuff/site/posts/$1.txt
    vi ~/stuff/site/posts/$1.txt
}

function search(){
    rg -i "$1"
}

function DL(){
    echo -n $DOWNLOADS > /tmp/cpdownloads.txt && clip.exe < /tmp/cpdownloads.txt
}

function findsecret(){
    python3 /home/kaushik/stuff/boxes/bounty/finder.py -i "$1" -e -o cli
}

function basicrecon(){
    bash /home/kaushik/tools/findvulns.sh "$1"
}

function getalljs(){
    echo "$1" | subjs | fff -S
}

function burp(){
    cd $WINHOME/Downloads/
    java.exe -noverify -javaagent:burploader.jar -jar burpsuite_pro_v2021.8.4.jar
    cd ~-
}

function xss(){
    python3 ~/tools/XSStrike/xsstrike.py --seeds "$1" -l2 --crawl --threads 100
}

function send(){
    sshpass -p ******* scp ${@} pi@raspberrypi.local:~/sent
 }

function base(){
    tmux attach -t base >/dev/null 2>&1 || tmux new -s base
} 

function pushmedaddy(){
    git commit -a -m "$1" && git push
}

function publish(){
    cd ~/stuff/projects/jekyll/savvy/
    jekyll build
    cd _site && aws s3 cp . s3://savvy.kaushik.me --recursive --exclude ".git/*"
    # ssh -t pi@kaushik.me -p 2222 'cd ~/sites/savvy && git pull'
    echo 'done'
}

function portpublish(){
    cd ~/stuff/projects/jekyll/portfolio/
    jekyll build
    cd _site && aws s3 cp . s3://kaushik.me --recursive --exclude ".git/*"
    # ssh -t pi@kaushik.me -p 2222 'cd ~/sites/portfolio && git pull'
    echo 'done'
}

function newpost(){
    ~/stuff/code/utilities/new_post.sh $1
}

function office(){
    cwd=$(pwd)
    killall VLC 2>/dev/null
    cd /mnt/c/Users/kaush/Documents/The\ Office
    cd $(ls -d */|sort -R|tail -1)
    open "$(ls *.mkv|sort -R|tail -1)"
    cd $cwd
}

function friends(){
    cwd=$(pwd)
    cd /mnt/c/Users/kaush/Documents/Friends
    cd $(ls -d */|sort -R|tail -1)
    wait
    open "$(ls *.mkv|sort -R|tail -1)"
    cd $cwd
}

if [ "$TMUX" = "" ]
then
    base
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/kaushik/stuff/projects/trell/k8srbac/gcloud/google-cloud-sdk/path.bash.inc' ]; then . '/home/kaushik/stuff/projects/trell/k8srbac/gcloud/google-cloud-sdk/path.bash.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/home/kaushik/stuff/projects/trell/k8srbac/gcloud/google-cloud-sdk/completion.bash.inc' ]; then . '/home/kaushik/stuff/projects/trell/k8srbac/gcloud/google-cloud-sdk/completion.bash.inc'; fi
