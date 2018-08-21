#!/usr/bin/env zsh
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
setopt NO_BEEP
alias ls="ls -FG"
alias vi="vim"
alias s="screen -d -rRU"
alias mpl="mpv --no-audio-display --no-video"
alias rm="rm -i"
alias clip="xsel -i -b"
alias paste="upload 0x0"
alias mix="upload mixtape"
alias sprunge="upload sprunge"
alias ix="upload ix"
export LANG="en_US.UTF-8"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
#alias java="java -Dawt.useSystemAAFontSettings=on"
#export QT_STYLE_OVERRIDE=adwaita-dark
export PATH=${HOME}/bin:${PATH}:/usr/share/perl6/vendor/bin
export GOPATH="${HOME}/go"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export EDITOR=vim
set -o emacs
export MANPAGER="less"
export JAVA_HOME="https://github.com/GPUOpen-Tools/CodeXL"

autoload -U colors && colors
autoload compinit && compinit

new_kern() {
	local running=${$(uname -r)//-ARCH/}
	local installed=${${$(pacman -Q linux)//linux}// /} # don't worry about it
	if [[ $running != $installed ]]; then
		echo "(%F{yellow}*%f) "
	fi
}

#Bold cyan; hostname; normal; cwd; red; normal
PROMPT="%F{cyan}%B""%m""%f%b""%d-""%F{red}""%h""%f: "

RPROMPT="[%F{yellow}%?%f]"
PS2="%F{black}%B%_%f%F{green}%B>%f%b "
zstyle ':completion:*' rehash true

#source $HOME/zshit/lambda.zsh

setbg() {
	echo -ne "\033]11;#$1\007"
}

#lambda sansext=filename . 'sed "s/\(.*\)\..*$/\1/" <<< $filename'


conwert() {
	$@ | konwert cp437-utf8
}

# it doesn't work for some reason
#load() {
#	if [[ ! -x $1 ]]; then
#		local file=$1
#	else
#		local file=-
#	fi
#
#	foo=$(curl -F"fileToUpload=@$file" -F"reqtype=fileupload" https://catbox.moe/user/api.php)
#	clip <<< $foo
#	echo $foo
#}
zippy() {
	curl -F"fupload=@$1" -F"private=yes" http://www4.zippyshare.com/upload 2>&1 | grep 'http\:\/\/www4\.zippyshare\.com\/v\/.*\/file\.htm' | tail +3 | head -1
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
clc() {
	sbcl --no-userinit --load $1 --eval "(sb-ext:save-lisp-and-die \"$(sansext $1)\" :toplevel 'main :executable t)"
}


#eval $(thefuck --alias)

#. /etc/profile.d/emscripten.sh
. ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
