[[ $- != *i* ]] && return

# BASH configs
source "$HOME/.bash_aliases"

# MY FZF-CONFIG
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND="fd ."
export FZF_DEFAULT_OPTS="--style minimal"


# PATHS
export PATH="$PATH:$(go env GOPATH)/bin"

export EDITOR=nvim

eval "$(starship init bash)"
eval "$(zoxide init bash)"
