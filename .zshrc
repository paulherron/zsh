# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew vi-mode)

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob correctall

export PATH=~/bin:/usr/local/sbin:/usr/local/bin:/Applications/android-sdk-macosx/tools:~/Projects/others/cake/cake/console:/Applications/GitX.app/:$PATH

export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"

alias zr="vim ~/.bashrc"
alias szr="source ~/.bashrc"
alias st="speedtest-cli"

alias page="lynx -dump -nolist -notitle -width 2000"

# git aliases
alias b="git branch"
alias s="git status"
alias c="git commit"
alias ca="git commit -a -m"
alias fmc="git commit -a -m 'Fix merge conflict.'"
alias p="git pull"
alias pp="git push"
alias l="git log -n 8"
alias m="git checkout master"
alias d="git diff"
alias gc="git clone"

alias u="cd .."
alias u2="cd ../.."
alias u3="cd ../../.."
alias u4="cd ../../../.."

alias D="cd ~/Desktop"
alias P="cd ~/Projects"

# Shortcuts to various project directories
alias _ph="cd ~/Projects/paulherron/site"
alias _pha="cd ~/Projects/paulherron-admin"
alias _nk="cd ~/Projects/notekick/site"
alias _nka="cd ~/Projects/notekick-admin"
alias _ss="cd ~/Projects/showstudio/site"
alias _ssa="cd ~/Projects/showstudio-admin"
alias _pm="cd ~/Projects/proceptmedical/site"
alias _cs="cd ~/Projects/cookseystudio/site"
alias _sswl="cd ~/Projects/supersimpleweightlog/site"
alias _vim="cd ~/.vim"
alias _zsh="cd ~/.zsh"

alias mvim='open -a MacVim'

alias showstudio_database="rsync showstudio@dev.showstudio.com:/mnt/briefcase/backup/daily.0/trousers/mnt/rucksack/backup/database/`date \+\%Y-\%m-\%d`* ~/Backup/trousers/database"
alias cummerbund_update="rsync -av --delete showstudio@dev.showstudio.com:/mnt/briefcase/backup/daily.0/trousers/mnt/rucksack/showstudio/webroot /Volumes/cummerbund/Projects/showstudio/site/"
alias move_screenshots="mv ~/Desktop/Screen\ Shot* ~/Documents/screenshots/"
alias gfm="marked --gfm"

alias -g L='| less'
alias -g G='| grep'
alias -g ..2='../..'

autoload -Uz compinit
compinit

PROMPT="%m:%c %{$fg[green]%}%n%{$fg[blue]%} %T%{$fg[black]%} $ "
