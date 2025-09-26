[[ $- != *i* ]] && return

# BASH configs
source "$HOME/.bash_aliases"

# MY FZF-CONFIG
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND="fd ."
export FZF_DEFAULT_OPTS="--style minimal"

# ----
# PATHS
# ----

# Go
export PATH="$PATH:$(go env GOPATH)/bin"

# C-sharp
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

# NodeJS
export PATH="$HOME/nodejs/bin:$PATH"

# NVIM
export EDITOR=nvim

# ---
# HISTORY
# ---
HISTSIZE=1000
HISTFILESIZE=1000
HISTCONTROL=ignoredups

eval "$(starship init bash)"
eval "$(zoxide init bash)"
