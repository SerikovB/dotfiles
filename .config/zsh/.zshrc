#!/usr/bin/env zsh

# Navigation
setopt AUTO_CD

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

setopt CORRECT
setopt CDABLE_VARS
setopt EXTENDED_GLOB

setopt HIST_SAVE_NO_DUPS

# History
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

# Aliases
source $HOME/.config/aliases/aliases

# Prompt
fpath=($HOME/.config/zsh/prompt $fpath)
autoload -Uz prompt_purification_setup; prompt_purification_setup

autoload -Uz compinit; compinit
_comp_options+=(globdots)


bindkey -v
export KEYTIMEOUT=1


autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
        bindkey -M $km -- '-' vi-up-line-or-history
        for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
                        bindkey -M $km $c select-quoted
        done
        for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
                bindkey -M $km $c select-bracketed
        done
done

autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

