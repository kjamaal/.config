#!/bin/zsh

##
# Environment variables
#

# -U ensures each entry in these is Unique (that is, discards duplicates).
export -U PATH path FPATH fpath MANPATH manpath
export -UT INFOPATH infopath  # -T creates a "tied" pair; see below.
export ZSH="/Users/jkirkpatrick/.oh-my-zsh"
export AWS_PROFILE=main_mfa

#git
export PATH=/usr/local/Cellar/git/2.28.0/bin:$PATH

#rbenv
export GEM_PATH=/Users/jkirkpatrick/.rbenv/versions/2.5.8/lib/ruby/gems

#amplify
export PATH="$HOME/.amplify/bin:$PATH"

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/awscli@1/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="aussiegeek"

# Which oh-my-zsh plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export PATH=$PATH:/Users/jkirkpatrick/devops-utils/scripts:/Applications/pgAdmin\ 4.app/Contents/SharedSupport/

# $PATH and $path (and also $FPATH and $fpath, etc.) are "tied" to each other.
# Modifying one will also modify the other.
# Note that each value in an array is expanded separately. Thus, we can use ~
# for $HOME in each $path entry.
path=(
    /home/linuxbrew/.linuxbrew/bin(N)	# (N): null if file doesn't exist
    $path
    ~/.local/bin
)

# Add your functions to your $fpath, so you can autoload them.
fpath=(
    $ZDOTDIR/functions
    $fpath
    ~/.local/share/zsh/site-functions
    ~/.config/zsh/functions
)
export PATH="$fpath:$PATH"

if command -v brew > /dev/null; then
  # `znap eval <name> '<command>'` is like `eval "$( <command> )"` but with
  # caching and compilation of <command>'s output, making it 10 times faster.
  znap eval brew-shellenv 'brew shellenv'

  # Add dirs containing completion functions to your $fpath and they will be
  # picked up automatically when the completion is initialized.
  # Here, we add it to the end of $fpath, so that we use brew's completions
  # only for those commands that zsh doesn't already know how to complete.
  fpath+=( $HOMEBREW_PREFIX/share/zsh/site-functions )
fi

#iterm shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#custom functions stored in ~/.config/zsh/functions
autoload base ecs-exec
base

##initialize pyenv
#export PYENV_ROOT="${HOME}/.pyenv"
#export PATH="${PYENV_ROOT}/bin:$PATH"
#eval "$(pyenv init -)"
