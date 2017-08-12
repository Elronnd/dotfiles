#!/usr/bin/env zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
alias ls="ls -FG"
alias vi="vim"
alias s="screen -d -rRU"
alias mpl="mpv --no-audio-display"
export LANG="en_US.UTF-8"
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
alias java="java -Dawt.useSystemAAFontSettings=on"
export QT_STYLE_OVERRIDE=adwaita-dark
export PATH=${HOME}/bin:${PATH}:${HOME}/nim/bin:${HOME}/.dmd-install/linux/bin64:${HOME}/.dmd-install/bin:/opt/intel/bin
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
	if [[ ! -x $1 ]]; then
		local file=$1
	else
		local file=-
	fi

	echo $(curl --progress-bar -F"file=@$file" https://0x0.st)
}
load() {
	if [[ ! -x $1 ]]; then
		local file=$1
	else
		local file=-
	fi

	echo $(curl --progress-bar -F"fileToUpload=@$file" -F"reqtype=fileupload" https://catbox.moe/user/api.php)
}
sprunge() {
	if [[ ! -x $1 ]]; then
		local file=$1
	else
		local file=-
	fi

	echo $(curl --progress-bar -F"sprunge=@$file" http://sprunge.us/)
}
ix() {
	if [[ ! -x $1 ]]; then
		local file=$1
	else
		local file=-
	fi

	echo $(curl --progress-bar -F"f:1=@$file" http://ix.io/)
}
zippy() {
	curl -F"fupload=@$1" http://www21.zippyshare.com/upload | cut -c 67-| cut -c -48
}

unset SSH_AUTH_SOCK
. ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
