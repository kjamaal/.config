#!/bin/zsh

##
# Named directories
#

# Create shortcuts for your favorite directories.
# `hash -d <name>=<path>` makes ~<name> a shortcut for <path>.
# You can use this ~name anywhere you would specify a dir, not just with `cd`!
hash -d z=$ZDOTDIR
hash -d g=$gitdir


# To be safe, use autocd only with paths starting with ~ (including named
# directories), .. or /
setopt AUTO_CD
