#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# BASH configs
source "$HOME/.bash_aliases"

# My fzf-config
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_DEFAULT_OPTS="--style default --preview '~/.config/fzf/fzf-preview.sh {}'"


# PATHS
export PATH="$PATH:$(go env GOPATH)/bin"

export EDITOR=nvim
# PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
eval "$(zoxide init bash)"
