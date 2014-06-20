autoload colors; colors

# Use a file called .zshrc.local if present, to allow this machine to have its own overrides.
# ~/.zsh/.zshrc.local should be ignored in version control.
LOCAL_ZSHRC=~/.zsh/.zshrc.local
if [[ -f $LOCAL_ZSHRC ]]; then
	source $LOCAL_ZSHRC
fi

source ~/.profile
source ~/.zsh/completion.zsh
source ~/.zsh/termsupport.zsh

export PATH=~/bin:/usr/local/sbin:/usr/local/bin:$PATH

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob
unsetopt NOMATCH

# Aliases for quick editing of config files.
alias zr="vim ~/.zshrc"
alias zrl="vim ~/.zsh/.zshrc.local"
alias szr="source ~/.zshrc"
alias stc="speedtest-cli"
alias sc="vim ~/.ssh/config"
alias tc="vim ~/.tmux.conf"

alias .vim="cd ~/.vim"
alias .bash="cd ~/.bash"
alias .zsh="cd ~/.zsh"
alias .tmux="cd ~/.tmux"

# git aliases
alias b="git branch"
alias c="git commit"
alias ca="git commit -a -m"
alias cl="git clone"
alias co="git checkout"
alias d="git --no-pager diff"
alias fmc="git commit -a -m 'Fix merge conflict.'"
alias gc="git clone"
alias l="git --no-pager log -n 8"
alias m="git merge"
alias mn="git merge --no-ff"
alias p="git pull"
alias pp="git push"
alias ppo="git push origin master"
alias s="git status"
alias ss="git status -sb"
alias gk="gitk&"

# CakePHP aliases
alias ccc="cake clear_cache"

alias ll="ls -l"
alias k="killall"
alias pc="pngcrush -ow"
alias x="clear"

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
