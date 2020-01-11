#!/usr/bin/env zsh
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
setopt NO_BEEP
setopt histignorespace

# LINUX IS A FUCKING STUPID RETARTED AWFUL I HATE IT I HATE IT I HATE IT STUPID PIECE OF SHIT I JUST WANT THE DAMN CORE FILE FUCK YOU LINUX
ulimit -c unlimited

if [[ $(uname) = Linux ]]; then
	alias ls="ls -F --color=auto"
elif [[ $(uname) = OpenBSD ]]; then
	alias ls="colorls -FG"
else
	alias ls="ls -FG"
fi
ms_excel() {
	winef office
	pushd ~/.cxoffice/Microsoft_Office_365/drive_c/Program\ Files/Microsoft\ Office/root/Office16/
	wine EXCEL.EXE
	popd
}
ms_word() {
	winef office
	pushd ~/.cxoffice/Microsoft_Office_365/drive_c/Program\ Files/Microsoft\ Office/root/Office16/
	wine WINWORD.EXE
	popd
}
ms_ppt() {
	winef office
	pushd ~/.cxoffice/Microsoft_Office_365/drive_c/Program\ Files/Microsoft\ Office/root/Office16/
	wine OUTLOOK.EXE
	popd
}
objdump() {
	=objdump -M intel $@ | ddemangle
}
alias gl="googler --count 3 --noprompt"
alias vi="vim"
alias s="screen -d -rRU"
alias mpl="mpv --no-audio-display --no-video"
alias rm="rm -i"
alias clip="xsel -i -b"
alias paste="upload 0x0"
alias load="upload catbox"
alias sprunge="upload sprunge"
alias ix="upload ix"
alias timer="xterm -cr '#010000' -fa 'DejaVu Sans Mono' -geom 8x1 -bg black -fg white -fs 10 -e 'perl6 timer.p6'"
alias bat="bat --theme peachpuff -p"
alias gdb="gdb -q"
#if [[ -v WSL ]]; then
#	alias wig=git.exe
#	alias dub=dub.exe
#	alias dmd=dmd.exe
#	alias rdmd=rdmd.exe
#fi

# Make Qt applications shut up
export XDG_RUNTIME_DIR=/tmp/runtime-elronnd
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
#alias java="java -Dawt.useSystemAAFontSettings=on"
#export QT_STYLE_OVERRIDE=adwaita-dark
export PATH=$HOME/bin:$HOME/.gdcinstall/bin:$HOME/.p6install/bin:$HOME/.p6install/share/perl6/site/bin:${PATH}:/usr/local/bin/:$HOME/.wine-install/bin:/opt/texlive/2019/bin/x86_64-linux/:$HOME/.dyalog/opt/mdyalog/17.1/64/unicode/:$HOME/.cargo/bin

export GOPATH="${HOME}/go"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export MANPATH=/usr/share/man/:/opt/texlive/2019/texmf-dist/doc/man/
export EDITOR=vim
set -o emacs
#export DISPLAY=:0
export MANPAGER="less"
export SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0

autoload -U colors && colors
autoload compinit && compinit

new_kern() {
	local running=${$(uname -r)//-ARCH/}
	local installed=${${$(pacman -Q linux)//linux}// /} # don't worry about it
	if [[ $running = $installed ]]; then
	else
		echo "(%F{yellow}*%f) "
	fi
}

#Bold cyan; hostname; normal; cwd; red; normal
PROMPT="%F{cyan}%B""%m""%f%b""%d-""%F{red}""%h""%f: "

RPROMPT="[%F{yellow}%?%f]"
PS2="%F{black}%B%_%f%F{green}%B>%f%b "
zstyle ':completion:*' rehash true

source $HOME/code/zshit/lambda.zsh

setbg() {
	echo -ne "\033]11;#$1\007"
}

lambda sansext=filename . 'sed "s/\(.*\)\..*$/\1/" <<< $filename'


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

winef() {
	local _winef_dict=(
	fnv .wine-fnv 64
	gog .wine-gog 64
	office .cxoffice/Microsoft_Office_365 32
	skyrim .wine-skyrim 32
	)

	found=false
	for key dir arch in $_winef_dict; do
		if [[ "$key" == "$1" ]]; then
			found=true
			break;
		fi
	done

	if ! $found; then
		echo "No such key '$1'"
		return
	fi

	#if [[ ! -f "$dir" ]]; then
	#	echo "No such dir $dir"
	#	return
	#fi
	#export WINEPREFIX=$(readlink -f "$dir")
	export WINEPREFIX="$HOME/$dir"
	export WINEARCH=win$arch
	if [[ $key = office ]]; then
		export PATH="$HOME/.crossoverr-install/bin:$PATH"
	fi
}

alarm() {
	_do_alarm() {
		local brightness=$(xbacklight)
		# if the screen is dim, briefly brighten it, otherwise do the other way around
		if [[ $brightness -lt 50 ]]; then
			xbacklight -set 100 -steps 1 -time 0
		else
			xbacklight -set 1 -steps 1 -time 0
		fi

		sleep .06

		# restore the previous brightness
		xbacklight -set $brightness -steps 1 -time 0
	}

	$@
	_do_alarm
}




#eval $(thefuck --alias)

#. /etc/profile.d/emscripten.sh
. ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
