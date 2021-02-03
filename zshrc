#!/usr/bin/env zsh
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
setopt NO_BEEP
setopt histignorespace

# LINUX IS A FUCKING STUPID RETARTED AWFUL I HATE IT I HATE IT I HATE IT STUPID PIECE OF SHIT I JUST WANT THE DAMN CORE FILE FUCK YOU LINUX
ulimit -c unlimited

if [[ ! -z $ARCAN_CONNPATH ]]; then
	export QT_QPA_PLATFORM=wayland
fi

if [[ $(uname) = Linux ]]; then
	alias ls="ls -F --color=auto"
	export PATH=$HOME/bin/l:$PATH
elif [[ $(uname) = OpenBSD ]]; then
	alias ls="colorls -FG"
elif [[ $(uname) = FreeBSD ]]; then
	export PATH=$HOME/bin/f:$PATH
	export JAVA_VERSION=15
	alias ls="ls -FG"
	export CMAKE_PREFIX_PATH=/usr/local/llvm10 #ceeeeeeeeeeeeeeeeeeemake
	# Make Qt applications shut up
	export XDG_RUNTIME_DIR=/tmp/runtime-mc
fi
export WINEESYNC=1
export WINEFSYNC=1
alias youtube-dl="youtube-dl --all-subs"
alias bc='bc -lq'
alias xpdf="xpdf -z width"
alias python='python -q'
alias octave="octave -q"
alias sbcl='rlwrap sbcl --noinform'
alias objdump="objdump -M intel"
alias ndsm="ndisasm -b 64"
alias obdsm="objdump -b binary -Mintel,x86-64 -mi386 -D"

# objdump() {
# 	=objdump -M intel $@ | ddemangle
# }

alias vi="vim"
alias s="screen -d -rRU"
alias mpl="mpv --no-audio-display --no-video"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias clip="xsel -i -b"
alias unclip="xsel -o"
alias paste="upload 0x0"
alias load="upload catbox"
alias sprunge="upload sprunge"
alias ix="upload ix"
alias hate="upload haste"
alias gdb="gdb -q"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
#export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export QHOME=$HOME/.kdb
#alias java="java -Dawt.useSystemAAFontSettings=on"
#export QT_STYLE_OVERRIDE=adwaita-dark
PATH="$HOME/bin:$HOME/.dotfiles/bin:/usr/local/bin:$PATH:$HOME/.arcanstall/bin:$HOME/.rakudoinstall/bin:$HOME/.raku/bin:$HOME/exe/bin:/d/media/linux_apps/bin:/d/media/linux_games/bin:$HOME/.local/bin:$HOME/.fbsdd/dmd2/freebsd/bin64"
#PATH="$HOME/bin:/bin:/usr/local/bin:/usr/bin:$HOME/.arcanstall/bin:$HOME/.rakudoinstall/bin:$HOME/.raku/bin:$HOME/exe/bin:/d/media/linux_apps/bin:/d/media/linux_games/bin:$HOME/.local/bin:$HOME/.fbsdd/dmd2/freebsd/bin64"
#export PATH=$HOME/bin:$HOME/code/dmd/install/linux/bin64:$HOME/code/dmd/dub/bin:$HOME/code/dmd/install/bin:$HOME/.emacsinstall/bin:$HOME/.gdcinstall/bin:$HOME/.p6install/bin:$HOME/.p6install/share/perl6/site/bin:/bin:/usr/local/bin:/opt/texlive/2019/bin/x86_64-linux:$HOME/.cargo/bin:$HOME/.arcanstall/bin:/usr/local/Wolfram/WolframEngine/12.0/Executables:/usr/local/Wolfram/WolframEngine/12.0/SystemFiles/Kernel/Binaries/Linux-x86-64:$HOME/.winestall/bin:$HOME/games/bin:$HOME/.local/bin #:$HOME/.dyalog/opt/mdyalog/17.1/64/unicode/

export GOPATH="${HOME}/go"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
#export MANPATH=/usr/share/man:/opt/texlive/2019/texmf-dist/doc/man
export EDITOR=vim
set -o emacs
#export DISPLAY=:0
export MANPAGER="less"
export SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS=0
export DYALOG_LINEEDITOR_MODE=1

autoload -U colors && colors
autoload compinit && compinit

#Bold cyan; hostname; normal; cwd; red; normal
PROMPT="%F{cyan}%B""%m""%f%b""%d-""%F{red}""%h""%f: "

# no rprompt when in emacs/vterm, because it messes stuff up
if [[ -z $INSIDE_EMACS ]]; then
    RPROMPT="[%F{yellow}%?%f]"
fi

PS2="%F{black}%B%_%f%F{green}%B>%f%b "
zstyle ':completion:*' rehash true

#source $HOME/code/zshit/lambda.zsh

setbg() {
	echo -ne "\033]11;#$1\007"
}

#lambda sansext=filename . 'sed "s/\(.*\)\..*$/\1/" <<< $filename'


conwert() {
	$@ | konwert cp437-utf8
}

em() {
	DISPLAY= emacs $@
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

encrypt() {
	local INFILE="$1"
	local OUTFILE="$1.enc"
	openssl aes-256-cbc -salt -pbkdf2 -iter 100000 -md sha512 -in "$INFILE" -out "$OUTFILE" && rm -f "$INFILE"
}
decrypt() {
	local INFILE="$1"

	# for 'foo.bla.bar.baz.enc.oopsanotherextension'
	# Grab 'foo.bla.bar.baz.enc', '.', and 'oopsanotherextension'
	# and replace with 'foo.bla.bar.baz.enc'
	local OUTFILE="$(sed 's/\(.*\)\..*$/\1/' <<< "$INFILE")"

	# But if it's just 'fooblabarbaz', then there's nothing after the '.'
	# to take away, so in = out = 'fooblabarbaz', which openssl won't like.
	# So if they're the same, then add a '.decrypted' sufix
	if [[ "$INFILE" = "$OUTFILE" ]]; then
		OUTFILE="$INFILE.decrypted"
	fi

	openssl aes-256-cbc -d -salt -pbkdf2 -iter 100000 -md sha512 -in "$INFILE" -out "$OUTFILE"
}
decview() {
	local INFILE="$1"

	openssl aes-256-cbc -d -salt -pbkdf2 -iter 100000 -md sha512 -in "$INFILE" | less
}
decdit() {
	local FILE="$1"
	# TODO: preserve file extension in $tmpfile
	local tmpfile=$(mktemp)
	local pw
	printf " "; read -s pw
	openssl aes-256-cbc -d -salt -pbkdf2 -iter 100000 -md sha512 -in "$FILE" -out $tmpfile -pass fd:3 3<<< "$pw" || { echo "bad pw"; return 1 }
	moddate=$(date -r $tmpfile +%s)
	vim $EFLAGS $tmpfile
	nmoddate=$(date -r $tmpfile +%s)
	if [[ $moddate != $nmoddate ]]; then
		openssl aes-256-cbc -salt -pbkdf2 -iter 100000 -md sha512 -in $tmpfile -out "$FILE" -pass fd:3 3<<< "$pw" && rm -f $tmpfile
	else
		rm -f $tmpfile
	fi
}
diary() {
	export EFLAGS=(-c "normal!O$(date "+%Y-%m-%d (%A)")


" -c normal!kO +star)
	decdit /d/diary.txt.enc
}
clc() {
	sbcl --no-userinit --eval "(load (compile-file \"$1\"))" --eval "(sb-ext:save-lisp-and-die \"$2\" :toplevel (lambda () (main sb-ext:*posix-argv*)) :executable t)"
}

winef() {
	local _winef_dict=(
	tw3 .wine-tw3 64
	ow .wine-ow 64
	wiiusb .wine-wiiusb 32
	cemu .wine-cemu 64
	rdr2 .wine-rdr2 64
	ds .wine-ds 64
	)

	if [[ -z $1 ]]; then
		echo WINEPREFIX="$WINEPREFIX"
		echo WINEARCH="$WINEARCH"
		return
	fi

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
	echo export WINEPREFIX="$HOME/$dir"
	echo export WINEARCH=win$arch
	export WINEPREFIX="$HOME/$dir"
	export WINEARCH=win$arch
	if [[ $key = office ]]; then
		export PATH="$HOME/.crossoverr-install/bin:$PATH"
	fi
}

alarm() {
	_do_alarm() {
		local brightness=$(light)
		# if the screen is dim, briefly brighten it, otherwise do the other way around
		if [[ $brightness -lt 50 ]]; then
			light 100
		else
			light 1
		fi

		sleep .06

		# restore the previous brightness
		light $brightness
	}

	$@
	_do_alarm
}

timer() {
	for i in {$1..1}; do printf "\r%${#1}d" $i; sleep 1; done
	echo "\r$1 seconds - done!"
}

PATH="/home/mc/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/mc/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/mc/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/mc/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/mc/perl5"; export PERL_MM_OPT;

. ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
