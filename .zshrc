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

# export PATH=$PATH:/Applications/MAMP/bin/php/php5.6.10/bin

# alias
alias la='ls -a'
alias sshfscb='sshfs s1411365@borage01.coins.tsukuba.ac.jp:/home/ugrad/14/s1411365 coins'
alias sshfscc='sshfs s1411365@crocus01.coins.tsukuba.ac.jp:/home/ugrad/14/s1411365 coins'
alias sshcb='ssh s1411365@borage01.coins.tsukuba.ac.jp'
alias sshcc='ssh s1411365@crocus01.coins.tsukuba.ac.jp'
alias sshut='ssh s1411365@ubuntu.u.tsukuba.ac.jp'
alias og++='g++ -framework OpenGL -framework GLUT -framework Foundation -Wno-deprecated -Wno-deprecated-declarations'
alias reshell='exec $SHELL -l'
alias sk='saykana'
alias tas='tmux attach-session -t'
alias tls='tmux ls'
alias tks='tmux kill-session -t'
alias tns='tmux new-session'
alias lsusb='system_profiler SPUSBDataType'
alias vim='vi'
alias emacs='/usr/local/Cellar/emacs/24.5/bin/emacs-24.5'

# export PATH="$PATH:/Applications/android-sdk/platform-tools"
export PATH="$PATH:/Users/yuto/Library/Android/sdk/platform-tools"

# tmux-auto-attach
function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function tmux_automatically_attach_session()
{
    if is_screen_or_tmux_running; then
        ! is_exists 'tmux' && return 1

        if is_tmux_runnning; then
            echo "${fg_bold[white]} ご注文は${fg_bold[red]}NewPain${fg_bold[white]}ですか${fg_bold[red]}？？ ${reset_color}"
        elif is_screen_running; then
            echo "This is on screen."
        fi
    else
        if shell_has_started_interactively && ! is_ssh_running; then
            if ! is_exists 'tmux'; then
                echo 'Error: tmux command not found' 2>&1
                return 1
            fi

            if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
                # detached session exists
                tmux list-sessions
                echo -n "Tmux: attach? (y/N/num) "
                read
                if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
                    tmux attach-session
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
                    tmux attach -t "$REPLY"
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                fi
            fi

            if is_osx && is_exists 'reattach-to-user-namespace'; then
                # on OS X force tmux's default command
                # to spawn a shell in the user's namespace
                tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
                tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
            else
                tmux new-session && echo "tmux created new session"
            fi
        fi
    fi
}
tmux_automatically_attach_session

# OPAM configuration
. /Users/yuto/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
