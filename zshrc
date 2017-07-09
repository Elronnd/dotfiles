#!/usr/bin/env zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
alias ls="ls -FG"
alias vi="vim"
alias s="screen -d -rRU"
export LANG="en_US.UTF-8"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
export QT_STYLE_OVERRIDE=adwaita-dark
export PATH=${HOME}/bin:${PATH}:${HOME}/nim/bin:${HOME}/.dmd-install/linux/bin64:${HOME}/.dmd-install/bin
. /etc/profile.d/emscripten.sh
export GOPATH="${HOME}/go"
autoload -U colors && colors
autoload compinit && compinit
#Bold cyan; hostname; normal; cwd; red; normal
PROMPT="%F{cyan}%B""%m""%f%b""%d-""%F{red}""%h""%f: "

RPROMPT="[%F{yellow}%?%f]"
PS2="%F{black}%B%_%f%F{green}%B>%f%b "
zstyle ':completion:*' rehash true
export MANPAGER="less"

setbg() {
	echo -ne "\033]11;#$1\007"
}


paste() {
	echo $(curl --progress-bar -F"file=@$1" https://0x0.st)
}
load() {
	echo $(curl --progress-bar -F"fileToUpload=@$1" -F"reqtype=fileupload" https://catbox.moe/user/api.php)
}
sprunge() {
	echo $(curl --progress-bar -F"sprunge=@$1" http://sprunge.us/)
}
ix() {
	echo $(curl --progress-bar -F"f:1=@$1" http://ix.io/)
}

unset SSH_AUTH_SOCK
. ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
