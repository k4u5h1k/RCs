# CTRL-T - Paste the selected files and directories onto the command-line
# CTRL-R - Paste the selected command from history onto the command-line
# ALT-C - cd into the selected directory
#  Ctrl + w   Cut the Word before the cursor to the clipboard.
#  Ctrl + k   Cut the Line after the cursor to the clipboard.
#  Ctrl + u   Cut/delete the Line before the cursor position.
#   Alt + Del Delete the Word before the cursor.
#   Alt + d   Delete the Word after the cursor.

unsetopt PROMPT_SP # Removes percentage at the beginning of shell
setopt hist_ignore_space

export PS1="Kaushik %1~ %# "
export CNG_PATH=/Users/Kaushik/stuff/programs/iot/contiki-ng
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export HISTSIZE=100000
export HISTORY_IGNORE="(&|ls|[bf]g|vi|history|exit|pwd|clear|mount|umount|[ \t]*)"
export SAVEHIST=$HISTSIZE
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

alias center="/Users/Kaushik/stuff/code/utilities/center/centerterm.applescript"
alias vboxmanage="VBoxManage"
alias ip="ifconfig | grep \"inet \" | awk '{print \$2}'"
alias pip="pip3"
# alias vim="mvim"
alias sz="source ~/.zshrc"
alias .v="vim ~/.vimrc"
alias .z="vim ~/.zshrc"
alias la="ls -la"
alias st="cd ~/stuff"
alias ..="cd .."
alias ...="cd ../.."
alias vi="nvim"
alias history="history 0"
alias install='HOMEBREW_NO_AUTO_UPDATE=1 brew install'
alias yesleep="echo '*********' | sudo -S pmset -b sleep 0; sudo pmset -b disablesleep 0"
alias nosleep="echo '*********' | sudo -S pmset -b sleep 0; sudo pmset -b disablesleep 1"
alias checknet="ping -c1 -t2 google.com 1>/dev/null 2>&1 0>&1 && echo -e \"\e[32mOnline boi\e[0m\" || echo \"\e[91mSorry offline boi\e[0m\""
alias jump="docker exec -it "
alias site="open ~/stuff/site/index.html"
alias hip="ifconfig utun2 | grep \"inet \" | cut -d ' ' -f 2 | cut -d ' ' -f 1"
alias azure="ssh -i ~/.azure/key.pem kaushik@kaushik.me"
alias typora="open -a typora"
alias httptor="tor -f /usr/local/etc/tor/torrc.sample"
alias tunnel="autossh -M 0 -fN -R 0.0.0.0:4444:localhost:22 -v -i ~/.azure/key.pem kaushik@kaushik.me"
alias screenshare="autossh -M 0 -fN -R 0.0.0.0:5900:localhost:5900 -v -i ~/.azure/key.pem kaushik@kaushik.me"
alias bindings="cat ~/stuff/misc/tmux_notes.txt"
alias docs="open ~/stuff/code/docs/python-3.7.10-docs-html/index.html"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
export KEYTIMEOUT=20

function cc(){
    echo -n $1 | pbcopy
}

function publish(){
    jekyll build
    cd _site && pushmedaddy 'fixed ROS title'
    ssh -i ~/.azure/key.pem -t kaushik@kaushik.me 'cd ~/musings/savvy && git pull'
    echo 'done'
}

function newpost(){
    ~/stuff/code/utilities/new_post.sh $1
}

function esp(){
    rshell --port /dev/tty.usbserial-0001 --baud 115200 -e 'vi'
}

function e(){
    fzf | vi `tr -d '\n'`
}

function song(){
    osascript /Users/Kaushik/stuff/code/spotify.applescript
}

function fuzz(){
    ffuf -c -w /Users/Kaushik/stuff/wordlists/directory-list-2.3-medium.txt -u $1 -e $2 -of csv -o ffuf.out
}

function pcop(){
    echo '*******' | base64 -d | pbcopy
}

function server(){
    ip=$(ifconfig utun2 | grep "inet " | cut -d ' ' -f 2 | cut -d ' ' -f 1)
    echo "http://$ip:8080/"
    python3 -m http.server 8080
}

function damn(){
    docker run --rm -it -p 80:80 vulnerables/web-dvwa &
    sleep 2
    open http://localhost:80/
}

function vimj(){
    vim $(j $1)
}

function makepost(){
    cp /Users/Kaushik/stuff/site/posts/template.html /Users/Kaushik/stuff/site/posts/$1.html
    sleep 1
    chmod 666 /Users/Kaushik/stuff/site/posts/$1.html
    touch /Users/Kaushik/stuff/site/posts/$1.txt
    vim /Users/Kaushik/stuff/site/posts/$1.txt
}

function send(){
 scp -i ~/Azure/pentest_key.pem ${@} kaushik@kaushik.me:/home/kaushik/sent
}

function host(){
    echo "*********" | sudo -S mvim /etc/hosts
}

function getcolor(){
    cat ~/stuff/code/utilities/colors.sh | grep "$1"
}

function grepfor(){
    grep -rnw . -e "$1" -l 2>/dev/null
}

function pushmedaddy(){
    git add . && git commit -m "$1" && git push
}

function office(){
    cwd=$(pwd)
    killall VLC 2>/dev/null
    cd /Volumes/SD/The\ Office/
    cd $(ls -d */|sort -R|tail -1)
    nohup vlc -f "$(ls *.mkv|sort -R|tail -1)" 1>/dev/null 2>&1 &
    cd $cwd
}

function vpn(){
    echo '*********'|sudo -S openvpn ~/Downloads/k4u5h1k.ovpn
}

function findhere(){
    find . -name "$1" 2>/dev/null
}

function friends(){
    cwd=$(pwd)
    killall VLC 2>/dev/null
    cd /Volumes/SD/Friends/
    cd $(ls -d */|sort -R|tail -1)
    wait
    nohup vlc -f "$(ls *.mkv|sort -R|tail -1)" >/dev/null 2>&1  &
    cd $cwd
}

function jnb(){
    jupyter notebook $1 > /dev/null 2>&1 &
}

function base(){
    tmux attach -t base >/dev/null 2>&1 || tmux new -s base
} 

function play(){
    nohup afplay "$1" &;
}

function mktxt(){
    mvim ~/stuff/notes/"$1".txt
}

function py(){
    clear; python3 "$1"
}

function c(){
    clang "$1" && ./a.out && rm a.out
}

function cpp(){
    g++ "$1" && ./a.out && rm a.out
}

function crack(){
    python3 /Users/Kaushik/stuff/projects/crypto/cracker.py "$1"
}

function fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
function fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-mvim} "${files[@]}"
}

# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
function vf() {
  local files
  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})
  if [[ -n $files ]]
  then
     mvim -- $files
     print -l $files[1]
  fi
}

# fd - cd to selected directory
function fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fda - including hidden directories
function fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

function runbot {
    nohup python3 /Users/Kaushik/stuff/projects/fax_discord/bot.py >/dev/null 2>&1  &
}

source /Users/Kaushik/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
setopt auto_cd
export SSL_CERT_FILE=/private/etc/ssl/cert.pem
export HISTCONTROL=ignorespace

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PATH modifications
export PATH="/usr/local/opt/python@3.7/bin:/usr/local/opt/python@3.8/bin:/opt/metasploit-framework/bin:/usr/local/sbin:/Users/Kaushik/stuff/exploit-database:/Users/Kaushik/stuff/programs:/Users/Kaushik/stuff/ctf/tools:/Users/Kaushik/stuff/code:/Users/Kaushik/Library/Python/3.7/bin:$PATH"

# Autojump setting
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
export EDITOR='nvim'
export DISABLE_AUTO_TITLE=true

# Good stuff
# Moving the cursor:
#   Ctrl + a   Go to the beginning of the line (Home)
#   Ctrl + e   Go to the End of the line (End)
#   Hold the Option key option and click on the current line = Jump Backwards

#   Ctrl + p   Previous command (Up arrow)
#   Ctrl + n   Next command (Down arrow)
#   Hold the Option key option and click on a previous line = Jump upwards

#   Ctrl + f   Forward one character
#   Ctrl + b   Backward one character
#    Alt + b   Back (left) one word      or use Option+Right-Arrow
#    Alt + f   Forward (right) one word  or use Option+Left-Arrow

#   Ctrl + xx  Toggle between the start of line and current cursor position
# Editing:
#  Ctrl + L   Clear the Screen, similar to the clear command

#   Alt + Del Delete the Word before the cursor.
#   Alt + d   Delete the Word after the cursor.
#  Ctrl + d   Delete character under the cursor
#  Ctrl + h   Delete character before the cursor (backspace)

#  Ctrl + w   Cut the Word before the cursor to the clipboard.
#  Ctrl + k   Cut the Line after the cursor to the clipboard.
#  Ctrl + u   Cut/delete the Line before the cursor position.

#   Alt + t   Swap current word with previous
#  Ctrl + t   Swap the last two characters before the cursor (typo).
#  Esc  + t   Swap the last two words before the cursor.

#  ctrl + y   Paste the last thing to be cut (yank)
#   Alt + u   UPPER capitalize every character from the cursor to the end of the current word.
#   Alt + l   Lower the case of every character from the cursor to the end of the current word.
#   Alt + c   Capitalize the character under the cursor and move to the end of the word.
#   Alt + r   Cancel the changes and put back the line as it was in the history (revert).
#  ctrl + _   Undo

#   TAB       Tab completion for file/directory names
# For example, to move to a directory 'sample1'; Type cd sam ; then press TAB and ENTER.
# type just enough characters to uniquely identify the directory you wish to open.

# Special keys: Tab, Backspace, Enter, Esc
# Text Terminals send characters (bytes), not key strokes.
# Special keys such as Tab, Backspace, Enter and Esc are encoded as control characters.
# Control characters are not printable, they display in the terminal as ^ and are intended to have an effect on applications.

# Ctrl+I = Tab
# Ctrl+J = Newline
# Ctrl+M = Enter
# Ctrl+[ = Escape

# Many terminals will also send control characters for keys in the digit row:
# Ctrl+2 → ^@
# Ctrl+3 → ^[ Escape
# Ctrl+4 → ^\
# Ctrl+5 → ^]
# Ctrl+6 → ^^
# Ctrl+7 → ^_ Undo
# Ctrl+8 → ^? Backward-delete-char

# Ctrl+v tells the terminal to not interpret the following character, so Ctrl+v Ctrl-I will display a tab character,
# similarly Ctrl+v ENTER will display the escape sequence for the Enter key: ^M

# History:
#   Ctrl + r   Recall the last command including the specified character(s)
#              searches the command history as you type.
#              Equivalent to : vim ~/.bash_history.
#   Ctrl + p   Previous command in history (i.e. walk back through the command history)
#   Ctrl + n   Next command in history (i.e. walk forward through the command history)

#   Ctrl + s   Go back to the next most recent command.
#              (beware to not execute it from a terminal because this will also launch its XOFF).
#   Ctrl + o   Execute the command found via Ctrl+r or Ctrl+s
#   Ctrl + g   Escape from history searching mode
#         !!   Repeat last command
#       !n     Repeat from the last command: args n e.g. !:2 for the second argumant.
#       !n:m   Repeat from the last command: args from n to m. e.g. !:2-3 for the second and third.
#       !n:$   Repeat from the last command: args n to the last argument.
#       !n:p   Print last command starting with n
#         !$   Last argument of previous command
#    ALT + .   Last argument of previous command
#         !*   All arguments of previous command
# ^abc­^­def   Run previous command, replacing abc with def
# Process control:
#  Ctrl + C   Interrupt/Kill whatever you are running (SIGINT)
#  Ctrl + l   Clear the screen
#  Ctrl + s   Stop output to the screen (for long running verbose commands)
#  Ctrl + q   Allow output to the screen (if previously stopped using command above)
#  Ctrl + D   Send an EOF marker, unless disabled by an option, this will close the current shell (EXIT)
#  Ctrl + Z   Send the signal SIGTSTP to the current task, which suspends it.
#             To return to it later enter fg 'process name' (foreground).
# To use the Alt Key Shortcuts in macOS - Open Terminal Preferences | Settings Tab | Keyboard | Tick "Use option as meta key"
export OPENSSL_ROOT_DIR=/usr/local/opt/openssl@1.1

export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ "$TMUX" = "" ]
then
    base
fi
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
