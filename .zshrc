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

bindkey -e

export PATH=~/bin:/usr/local/sbin:/usr/local/bin:/Users/paulherron/.rvm/gems/ruby-2.1.1/gems/sass-3.2.19/bin:/Users/paulherron/.rvm/gems/ruby-2.1.1/gems/compass-0.12.6/bin:/usr/local/Cellar/ruby/2.1.1/bin:$PATH
# /usr/local/lib/ruby/gems/2.1.0/gems/rumember-1.0.1/bin:

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
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
alias rb="git for-each-ref --count=16 --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias c="git commit"
alias ca="git commit -a -m"
alias cl="git clone"
alias co="git checkout"
alias d="git --no-pager diff"
alias fmc="git commit -a -m 'Fix merge conflict.'"
alias gc="git clone"
alias l="git --no-pager log -n 32 --pretty=oneline --abbrev-commit"
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
