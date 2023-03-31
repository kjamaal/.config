#!/bin/zsh
#
# This file, .zshrc, is sourced by zsh for each interactive shell session.

() {
  # `local` sets the variable's scope to this function and its descendendants.
  local gitdir=~  # Where to keep repos and plugins

  # Load all of the files in rc.d that start with <number>- and end in .zsh
  # (n) sorts the results in numerical order.
  # <-> is an open-ended range. It matches any non-negative integer.
  # <1-> matches any integer >= 1. <-9> matches any integer <= 9.
  # <1-9> matches any integer that's >= 1 and <= 9.
  local file=
  for file in $ZDOTDIR/rc.d/<->-*.zsh(n); do
    . $file
  done
} "$@"
