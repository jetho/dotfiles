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

# fasd
eval "$(fasd --init auto)"
alias v='f -e vim' # quick opening files with vim

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && source ~/.fzf_functions.zsh

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

# youtube-dl
alias youtube-download="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4'"


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

# Always start with 256 colors
export TERM=xterm-256color
