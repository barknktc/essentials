#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Exportlar
export TERM="alacritty"            
export HISTCONTROL=ignoredups:erasedups 
export EDITOR="vim"      

#Aliases
alias ls='ls --color=auto'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I' 
alias cd..='cd ..'
alias pacmaq="pacman -Qeq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
#Shoptlar
shopt -s autocd



PS1='[\u \W]\$ '


function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

#cd ve ls i birlestirme
cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls -lAh --color=auto
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}


#Bash Completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

#Ilk Basta Cikan Resim
neofetch

keychain --nogui --quiet $HOME/.ssh/id_rsa
source $HOME/.keychain/RapsoravidesS-sh

