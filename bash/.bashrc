# ~/.bashrc
# vim:foldmethod=marker
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#------------------------------SUPERIOR BASHRC---------------------------------

PS1='[\u \W]\$ '

# ENVORIMENT VARIABLELARI------------------------------------------{{{1
export TERM="kitty"            
export EDITOR="nvim"      
export HISTCONTROL=ignoredups:erasedups 

# ALIASES----------------------------------------------------------{{{1

    # navigation---------------------------------------------------{{{2
    alias cd..="cd .."

    # list---------------------------------------------------------{{{2
    alias ll="ls -lAhG --color=always | sed -re 's/^[^ ]* //'"

    # warnings-----------------------------------------------------{{{2
    alias cp="cp -i"
    alias mv="mv -i"
    alias rm="rm -I" 

    # dir management-----------------------------------------------{{{2
    alias mkdir="mkdir -p -v"

    # git----------------------------------------------------------{{{2
    alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
    alias add="git add ."
    alias commit="git commit -m"
    alias push="git push"

    # pacman-------------------------------------------------------{{{2
    alias pac="sudo pacman"
    alias pacmaq="pacman -Qeq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"

    # general adjustments------------------------------------------{{{2
    alias ping="ping -c 5"
    alias vim="nvim"

    # }}}

# SHELL OPTIONS-----------------------------------------------------------{{{1

shopt -s autocd

# EKLENTILER-------------------------------------------------------{{{1

#Powerline
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

#Bash Completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

#Ilk Basta Cikan Resim
neofetch

# Oto SSH key 
keychain --nogui --quiet $HOME/.ssh/id_rsa
source $HOME/.keychain/RapsoravidesS-sh

