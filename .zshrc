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

alias copy="xsel -ib"

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
# Recently checked-out branches
alias gr="git reflog --grep-reflog=checkout -n 10"
alias l="git --no-pager log -n 32 --pretty=oneline --abbrev-commit"
alias m="git merge"
alias mn="git merge --no-ff"
alias p="git pull"
alias pp="git push"
alias ppo="git push --set-upstream origin"
alias s="git status"
alias ss="git status -sb"
alias gk="gitk&"

#alias gpga="eval $(gpg-agent --daemon)"

# CakePHP aliases
alias ccc="cake clear_cache"

alias ll="ls -l"
alias k="kubectl"
alias kc="kubectx"
alias kcp="kubectx capitalise-prod"
alias kcd="kubectx capitalise-development"
alias pc="pngcrush -ow"
alias x="clear"
alias lc='fc -ln -1 | awk '\''{$1=$1}1'\'' ORS='\'''\'' | pbcopy'

alias u="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias uuuu="cd ../../../.."

alias P="pass show"
alias Pe="pass edit"

#alias -g L='| less'
#alias -g G='| grep'
#alias -g ..2='../..'
#alias -g T="| tail"
#alias -g J='| jsonlint -t "    "'
#alias -g B='| browser'

#kn="kubectl config set-context $(kubectl config current-context) --namespace"
ke() {
	kubectl -n $kubeNamespace exec -it $1 -- bash
}

alias gfm="marked --gfm"
alias page="lynx -dump -nolist -notitle -width 2000"

autoload -Uz compinit
compinit

# Shortcuts to various project directories
alias .a="cd ~/Projects/capitalise/platfi-api-platform"
alias .aa="cd ~/Projects/angryarchi/site"
alias .cti="cd ~/Projects/const/site"
alias .cd="cd ~/Projects/cadogan/site"
alias .bs="cd ~/Projects/backup-spotify-playlists/site"
alias .c="cd ~/Projects/capitalise/platfi"
alias .d="cd ~/Projects/drilldown/app"
alias .ui="cd ~/Projects/capitalise/platfi-ui-app"
alias .q="cd ~/Projects/capitalise/platfi-ui-questionnaire"
alias .pla="cd ~/Projects/capitalise/platfi-api-platform"
alias .pro="cd ~/Projects/capitalise/platfi-api-products"
alias .tim="cd ~/Projects/capitalise/platfi-service-activity-timeline"
alias .cs="cd ~/Projects/cookseystudio/site"
alias .d="cd ~/Projects/drilldown/app"
alias .e="cd ~/Projects/capitalise/platfi-service-event-broker"
alias .ecs="cd ~/Projects/ecs/magento-pos"
alias .fr="cd ~/Projects/forevr/forevr_backend"
alias .kb="cd ~/Projects/keywordbookmarks/site"
alias .hp="cd ~/Projects/headphones/site"
alias .hh="cd ~/Projects/haygarth/site"
alias .h="cd ~/Projects/house/site"
alias .nk="cd ~/Projects/notekick/site"
alias .nka="cd ~/Projects/notekick-admin"
alias .ph="cd ~/Projects/paulherron/site"
alias .mb="cd ~/Projects/mbaco/site"
alias .mbo="cd ~/Projects/mbaco/site_old"
alias .m="cd ~/Projects/capitalise/platfi-service-offer-manager"
alias .p="cd ~/Projects/capitalise/platfi-service-offer-manager"
alias .p="cd ~/Projects/capitalise/platfi"
alias .pha="cd ~/Projects/paulherron-admin"
alias .pm="cd ~/Projects/proceptmedical/site"
alias .ps="cd ~/Projects/paulandseema/site"
alias .rn="cd ~/Projects/racketsportsnetwork/site"
alias .ss="cd ~/Projects/showstudio/site"
alias .s="cd ~/Projects/wirelesslogic/simpro"
alias .ct="cd ~/Projects/cakephp_test/site"
alias .ssa="cd ~/Projects/showstudio-admin"
alias .sswl="cd ~/Projects/supersimpleweightlog/site"
alias .sc="cd ~/Projects/soleilcapestang/site"
alias .tv="cd ~/Projects/theventure/site"
alias .t="cd ~/Projects/capitalise/platfi-service-activity-timeline"
alias .cr="cd ~/Projects/carlsonrezidor/site"
alias .yo="cd ~/Projects/yoo/site"

# Shortcut command for launching a resilient SSH session using autossh and tmux.
t() {
	autossh -t "$@" 'tmux attach || tmux new'
}

function ocr() {
	convert $1 -resize 400% -type Grayscale /private/tmp/ocr_input.tif && tesseract -l eng /private/tmp/ocr_input.tif stdout
}

# Docker aliases
alias dc="docker-compose"

# Vagrant aliases
alias vd="vagrant destroy"
alias vh="vagrant halt"
alias vr="vagrant reload"
alias vs="vagrant suspend"
alias vsa="vboxmanage list runningvms | sed -E 's/.*\{(.*)\}/\1/' | xargs -L1 -I {} VBoxManage controlvm {} savestate"
alias vu="vagrant up"
alias vp="vagrant provision"
alias vpc="vagrant provision --provision-with configure"

alias J="jekyll serve -w"

alias webcam="rsync -av pi@192.168.1.107:/home/pi/www/2014* ~/Desktop/webcam"
alias dl="youtube-dl"

alias aw="ansiweather"

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

#autoload -Uz vcs_info
#zstyle ':vcs_info:*' enable git svn
#function precmd () { vcs_info }
#setopt prompt_subst
#PS1="\$vcs_info_msg_0_$PS1"

PROMPT="$host_color%m%{$reset_color%}:%c %{$fg[green]%}%n%{$fg[blue]%} %T%{$reset_color%} $ "
