# -*- sh -*-
#
# # Use /bin/sh when no terminal is present
[[ ${TERM:-dumb} != "dumb" ]] || exec /bin/sh
[ -t 1 ] || exec /bin/sh

export TERM="xterm-256color"

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

autoload colors; colors
export PS1="%B[%{$fg[red]%}%n%{$reset_color%}%b@%B%{$fg[green]%}%m%b%{$reset_color%}:%~%B]%b "

alias l='ls -lG'
alias ll='ls -lG'
alias deldrfc='find . -name "*.drfc" -exec rm -rf {} \;'
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias vi='vim'
# aliases for Tmux
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias td='tmux detach'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# convenience aliases for editing configs
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'

case $TERM in
    sun-cmd)
        precmd () { print -Pn "\e]l%~\e\\" }
        preexec () { print -Pn "\e]l%~\e\\" }
        ;;
    *xterm*|rxvt|(dt|k|E)term)
        precmd () { print -Pn "\e]2;%n@%m:%~\a" }
        preexec () { print -Pn "\e]2;%n@%m:%~\a" }
        ;;
esac
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
# cd /usr/home/nasa/core

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
unsetopt beep
cd /goweb/vdr/src 
