# ~/.bashrc
# vim:foldmethod=marker
# If not running interactively, don't do anything

#------------------------------SUPERIOR BASHRC---------------------------------




[[ $- != *i* ]] && return   # If non interactive; exit 
PS1='[\u \W]\$ '    # Main dialog infos


# ENVORIMENT VARIABLELARI------------------------------------------{{{1
export TERM="kitty"            
export EDITOR="nvim"      
export HISTCONTROL=ignoredups:erasedups 
export MANPAGER="nvim -c 'set ft=man' -"
export MANWIDTH=80
export PATH=$PATH:/home/barkn/.config/coc/extensions/coc-clangd-data/install/11.0.0/clangd_11.0.0/bin

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
    #alias ping="ping -c 5"
    alias vim="nvim"

    # }}}

# SHELL OPTIONS-----------------------------------------------------------{{{1

shopt -s autocd

# EKLENTILER-------------------------------------------------------{{{1

#Starship Prompt
eval "$(starship init bash)"


#Bash Completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

#Ilk Basta Cikan Resim
neofetch

# Oto SSH key 
keychain --nogui --quiet $HOME/.ssh/id_rsa
source $HOME/.keychain/RapsoravidesS-sh

