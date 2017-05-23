autoload -U compinit
compinit

setopt auto_list
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt HIST_IGNORE_DUPS

autoload -U promptinit
promptinit
autoload -U colors
colors
PROMPT="%{$fg[yellow]%}%m%{$reset_color%}%# "
RPROMPT="[%d]"

# alias
alias la='ls -a'
alias reshell='exec $SHELL -l'
alias tas='tmux attach-session -t'
alias tls='tmux ls'
alias tks='tmux kill-session -t'
alias tns='tmux new-session'


