# Path to oh-my-zsh
ZSH=$HOME/.zsh/oh-my-zsh
source $ZSH/oh-my-zsh.sh

source ~/.zsh/.zshrc.local

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew vi-mode)

export PATH=~/bin:/usr/local/sbin:/usr/local/bin:$PATH

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob correctall

alias zr="vim ~/.zshrc"
alias szr="source ~/.zshrc"
alias stc="speedtest-cli"
alias sc="vim ~/.ssh/config"
alias tc="vim ~/.tmux.conf"

alias page="lynx -dump -nolist -notitle -width 2000"

# git aliases
alias b="git branch"
alias c="git commit"
alias ca="git commit -a -m"
alias d="git --no-pager diff"
alias fmc="git commit -a -m 'Fix merge conflict.'"
alias gc="git clone"
alias l="git --no-pager log -n 8"
alias m="git checkout master"
alias p="git pull"
alias pp="git push"
alias ppo="git push origin master"
alias s="git status"

# Vagrant aliases
alias v="vagrant"
alias vd="vagrant destroy"
alias vh="vagrant halt"
alias vr="vagrant reload"
alias vs="vagrant suspend"
alias vu="vagrant up"

alias ll="ls -l"
alias pc="pngcrush -ow"

alias u="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias uuuu="cd ../../../.."

alias D="cd ~/Desktop"
alias P="cd ~/Projects"

# Shortcuts to various project directories
alias _aa="cd ~/Projects/angryarchi/site"
alias _cs="cd ~/Projects/cookseystudio/site"
alias _nk="cd ~/Projects/notekick/site"
alias _nka="cd ~/Projects/notekick-admin"
alias _ph="cd ~/Projects/paulherron/site"
alias _pha="cd ~/Projects/paulherron-admin"
alias _pm="cd ~/Projects/proceptmedical/site"
alias _ss="cd ~/Projects/showstudio/site"
alias _ssa="cd ~/Projects/showstudio-admin"
alias _sswl="cd ~/Projects/supersimpleweightlog/site"

alias _vim="cd ~/.vim"
alias _bash="cd ~/.bash"
alias _zsh="cd ~/.zsh"
alias _tmux="cd ~/.tmux"

alias gfm="marked --gfm"

alias -g L='| less'
alias -g G='| grep'
alias -g ..2='../..'

autoload -Uz compinit
compinit

PROMPT="%m:%c %{$fg[green]%}%n%{$fg[blue]%} %T%{$fg[black]%} $ "

export AUTOSSH_PORT=0
export AUTOSSH_GATETIME=0
#export AUTOSSH_DEBUG=1

t() {
	# Update the window title with the tmux session.
	DISABLE_AUTO_TITLE="true"
	echo -ne "\e]1;tmux $@\a"
	DISABLE_AUTO_TITLE="false"

	autossh -t "$@" 'tmux attach || tmux new'
}
