autoload -Uz compinit
compinit
_comp_options+=(globdots)
zstyle ':completion:*' special-dirs false
eval "$(direnv hook zsh)"
