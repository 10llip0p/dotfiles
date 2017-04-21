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
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

eval "$(rbenv init -)"

# export PATH=$PATH:/Applications/MAMP/bin/php/php5.6.10/bin

# alias
alias la='ls -a'
alias og++='g++ -framework OpenGL -framework GLUT -framework Foundation -Wno-deprecated -Wno-deprecated-declarations'
alias reshell='exec $SHELL -l'
alias sk='saykana'
alias tas='tmux attach-session -t'
alias tls='tmux ls'
alias tks='tmux kill-session -t'
alias tns='tmux new-session'
alias lsusb='system_profiler SPUSBDataType'

# export PATH="$PATH:/Applications/android-sdk/platform-tools"
export PATH="$PATH:/Users/yuto/Library/Android/sdk/platform-tools"

export PATH=$HOME/.nodebrew/current/bin:$PATH

export PATH="$PATH:/Users/yuto/develop/scripts"

# OPAM configuration
. /Users/yuto/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
