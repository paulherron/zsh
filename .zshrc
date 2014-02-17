# Path to oh-my-zsh
ZSH=$HOME/.zsh/oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Use a file called .zshrc.local if present, to allow this machine to have its own overrides.
# ~/.zsh/.zshrc.local should be ignored in version control.
LOCAL_ZSHRC=~/.zsh/.zshrc.local
if [[ -f $LOCAL_ZSHRC ]]; then
	source $LOCAL_ZSHRC
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew vi-mode)

export PATH=~/bin:/usr/local/sbin:/usr/local/bin:$PATH

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob

# Aliases for quick editing of config files.
alias zr="vim ~/.zshrc"
alias zrl="vim ~/.zsh/.zshrc.local"
alias szr="source ~/.zshrc"
alias stc="speedtest-cli"
alias sc="vim ~/.ssh/config"
alias tc="vim ~/.tmux.conf"

alias _vim="cd ~/.vim"
alias _bash="cd ~/.bash"
alias _zsh="cd ~/.zsh"
alias _tmux="cd ~/.tmux"

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
alias gk="gitk&"

# CakePHP aliases
alias ccc="cake clear_cache"

# Vagrant aliases
alias vd="vagrant destroy"
alias vh="vagrant halt"
alias vr="vagrant reload"
alias vs="vagrant suspend"
alias vu="vagrant up"

alias j="jekyll serve -w"
alias ll="ls -l"
alias k="killall"
alias pc="pngcrush -ow"

alias u="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias uuuu="cd ../../../.."

alias -g L='| less'
alias -g G='| grep'
alias -g ..2='../..'
alias -g T="| tail"

alias gfm="marked --gfm"
alias page="lynx -dump -nolist -notitle -width 2000"

autoload -Uz compinit
compinit

PROMPT="$host_color%m%{$reset_color%}:%c %{$fg[green]%}%n%{$fg[blue]%} %T%{$reset_color%} $ "

export AUTOSSH_PORT=0
export AUTOSSH_GATETIME=0

# Shortcut command for launching a resilient SSH session using autossh and tmux.
t() {
	autossh -t "$@" 'tmux attach || tmux new'
}

# Shortcut command for `vagrant`, with a tweak to use the above `t` function when connecting via SSH.
v() {
	if [[ $1 == "ssh" ]]; then
		# Hijack the `v ssh` command to use t() function, i.e. using autossh and tmux.
		config="/tmp/vagrant_ssh_config"
		vagrant ssh-config > $config
		t -F $config default
	else
		# Pass everything else through to the `vagrant` command.
		vagrant "$@"
	fi
}
