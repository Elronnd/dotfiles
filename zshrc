#!/usr/bin/env zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
alias ls="ls -FG --color=always"
alias vi="vim"
alias s="screen -d -rRU"
alias mpl="mpv --no-audio-display --no-video"
alias rm="rm -i"
export LANG="en_US.UTF-8"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
#alias java="java -Dawt.useSystemAAFontSettings=on"
#export QT_STYLE_OVERRIDE=adwaita-dark
export PATH=${HOME}/bin:${PATH}:${HOME}/nim/bin:${HOME}/.dmd-install/linux/bin64:${HOME}/.dmd-install/bin:/opt/intel/bin
export GOPATH="${HOME}/go"
export DOTNET_CLI_TELEMETRY_OPTOUT=true
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


conwert() {
	$@ | konwert cp437-utf8
}


paste() {
	if [[ ! -x $1 ]]; then
		local file=$(mktemp).txt
		cp $1 $file
	else
		local file=-
	fi

	curl -F"file=@$file" https://0x0.st
	rm $file
	echo
}
load() {
	if [[ ! -x $1 ]]; then
		local file=$1
	else
		local file=-
	fi

	curl -F"fileToUpload=@$file" -F"reqtype=fileupload" https://catbox.moe/user/api.php
	echo
}
sprunge() {
	if [[ ! -x $1 ]]; then
		local file=$1
	else
		local file=-
	fi

	curl -F"sprunge=@$file" http://sprunge.us/
	echo
}
ix() {
	if [[ ! -x $1 ]]; then
		local file=$1
	else
		local file=-
	fi

	curl -F"f:1=@$file" http://ix.io/
	echo
}
zippy() {
	curl -F"fupload=@$1" http://www21.zippyshare.com/upload | cut -c 67-| cut -c -48
	echo
}

encrypt() {
	local INFILE=$1
	local OUTFILE=$1.enc
	openssl aes-256-cbc -salt -in $INFILE -out $OUTFILE && rm $INFILE
}
decrypt() {
	local INFILE=$1

	# for 'foo.bla.bar.baz.enc.oopsanotherextension'
	# Grab 'foo.bla.bar.baz.enc', '.', and 'oopsanotherextension'
	# and replace with 'foo.bla.bar.baz.enc'
	local OUTFILE=$(sed 's/\(.*\)\..*$/\1/' <<< $INFILE)

	# But if it's just 'fooblabarbaz', then there's nothing after the '.'
	# to take away, so in = out = 'fooblabarbaz', which openssl won't like.
	# So if they're the same, then add a '.decrypted' sufix
	if [[ $INFILE = $OUTFILE ]]; then
		OUTFILE=$INFILE.decrypted
	fi

	openssl aes-256-cbc -d -salt -in $INFILE -out $OUTFILE
}
redundant() {
	if [[ $# = 0 ]]; then
		echo "Error: need a file"
		return 1
	fi

	local file=$1

	if [[ $# = 1 ]]; then
		number=16
	else
		number=$2
	fi
	lennum=${#number}

	for copy in {1..$number}; do
		actualcopy=$(printf "%0${lennum}d" $copy)
		cp ${file} ${file}.${actualcopy}
	done
}





unset SSH_AUTH_SOCK
. ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
