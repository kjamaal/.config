#!/bin/zsh

##
# Commands, funtions and aliases
#
# Always set aliases _last,_ so they don't class with function definitions.
#


# These aliases enable us to paste example code into the terminal without the
# shell complaining about the pasted prompt symbol.
alias %= \$=


# zmv lets you batch rename (or copy or link) files by using pattern matching.
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#index-zmv
autoload -Uz zmv
alias zmv='zmv -Mv'
alias zcp='zmv -Cv'
alias zln='zmv -Lv'

# Note that, unlike Bash, there's no need to inform Zsh's completion system
# of your aliases. It will figure them out automatically.


# Set $PAGER if it hasn't been set yet. We need it below.
# `:` is a builtin command that does nothing. We use it here to stop Zsh from
# evaluating the value of our $expansion as a command.
: ${PAGER:=less}


# Associate file .extensions with programs.
# This lets you open a file just by typing its name and pressing enter.
# Note that the dot is implicit. So, `gz` below stands for files ending in .gz
alias -s {css,gradle,html,js,json,md,patch,properties,txt,xml,yml}=$PAGER
alias -s gz='gzip -l'
alias -s {log,out}='tail -F'


# Use `< file` to quickly view the contents of any file.
READNULLCMD=$PAGER  # Set the program to use for this.

alias av=ansible-vault
alias bastion="ssh bastion.qcentrix.local"
alias sbx_bastion="ssh -i ~/.ssh/id_rsa.sandbox.bastion ubuntu@54.205.49.90"
alias snippets="jrnl @snippet"
alias commands="jrnl @command"
alias g="git"
alias gs="git status"
alias gc="git commit -m $1"
alias gp="git push"
alias gco="git checkout"
alias ga="git add ."
alias gl="git log"
alias v="vagrant"
alias vs="vagrant status"
alias vsh="vagrant ssh"
alias vd="vagrant destroy"
alias vu="vagrant up"
alias ecs="ecs-cli"
alias ecsp="ecs-preview-darwin-v0.0.4"
alias ap="ansible-playbook"
alias ai="ansible-inventory"
alias bl="blink1-tool"
alias alert="blink.sh 10"
alias off="blink1-tool --off > /dev/null"
alias dps="docker ps"
alias di="docker images"
alias ds="docker stats"
alias bfg="bfg-1.13.0.jar"
alias main="q login -t $1"
alias sbx="q login -m sandbox_mfa -b sandbox -t $1"
