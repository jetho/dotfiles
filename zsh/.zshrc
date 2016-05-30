#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# tmux
alias tmux='tmux -2'
alias tma='tmux attach -d -t'
alias tmn='tmux new -s $(basename $(pwd))'
alias tml='tmux list-sessions'

# history
alias h='history 0'
alias hg='history 0 | egrep '

# ssh connections
alias qnap=ssht\ admin@qnap
alias raspberry=ssht\ pi@raspberrypi
alias volumio=ssht\ volumio@volumio


# For renaming groups of files. Examples: 
# zmv  'juliet-(*)' 'prospera-$1'
# zmv '(*).sh' '$1'
# Passing -n to zmv will show you what zmv would do, without doing anything. 
autoload zmv

# show Cabal sandbox status
function cabal_sandbox_info() {
    cabal_files=(*.cabal(N))
    if [ $#cabal_files -gt 0 ]; then
        if [ -f cabal.sandbox.config ]; then
            echo "%{$fg[green]%}sandboxed%{$reset_color%}"
        else
            echo "%{$fg[red]%}not sandboxed%{$reset_color%}"
        fi
    fi
}
 
PROMPT='%F{59}[$HISTCMD] '$PROMPT
RPROMPT="\$(cabal_sandbox_info) $RPROMPT"

alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS
