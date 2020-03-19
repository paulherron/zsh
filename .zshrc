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
#bindkey -v
#export KEYTIMEOUT=1

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory extendedglob
unsetopt NOMATCH

#kn="kubectl config set-context $(kubectl config current-context) --namespace"
ke() {
	kubectl -n $kubeNamespace exec -it $1 -- bash
}

autoload -Uz compinit
compinit

# Shortcut command for launching a resilient SSH session using autossh and tmux.
t() {
	autossh -t "$@" 'tmux attach || tmux new'
}

function ocr() {
	convert $1 -resize 400% -type Grayscale /private/tmp/ocr_input.tif && tesseract -l eng /private/tmp/ocr_input.tif stdout
}

function gx() {
	command gitx . &
	command osascript -e "delay .5" -e "tell application \"GitX\" to activate"
}

export AUTOSSH_PORT=0
export AUTOSSH_GATETIME=0

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

parse_git_branch() {
	git symbolic-ref --short HEAD 2> /dev/null || echo "*"
}

setopt prompt_subst
PROMPT="$host_color%m%{$reset_color%}:%c %{$fg[green]%}%n%{$fg[blue]%} %T%{$reset_color%} \$(parse_git_branch) $ "
