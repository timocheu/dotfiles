#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# BASH configs
source "$HOME/.bash_aliases"

# My fzf-config
export FZF_DEFAULT_COMMAND="fd . $HOME"

# PATHS
export PATH="$PATH:$(go env GOPATH)/bin"

export EDITOR=nvim
# PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
eval "$(zoxide init bash)"
