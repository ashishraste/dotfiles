#! /usr/bin/env bash

path_append() {
  for ARG in "$@"
  do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}

path_prepend() {
  for ((i=$#; i>0; i--)); 
  do
    ARG=${!i}
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="$ARG${PATH:+":$PATH"}"
    fi
  done
}

# Prepend path to Poetry and Goby binaries.
path_prepend "${HOME}/.poetry/bin"
path_prepend "/opt/goby/build/bin"
path_append "/home/freax/clones/c3ai-backseat/build/bin"

[[ -f ~/.bashrc ]] && . ~/.bashrc
