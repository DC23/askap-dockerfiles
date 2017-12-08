# Check for an interactive session
[ -z "$PS1" ] && return

# fix the default root ownership of the mounted volume
if [ ! -O "${HOME}" ]; then
    echo Fixing code volume ownership ...
    sudo chown -R askap:askap $HOME
    echo Done
fi

# Set our prompt.
export PS1="\[$(tput bold)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;2m\]@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;7m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;7m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# some aliases
alias ls='ls --group-directories-first --color=auto'
alias la='ls -Ah'
alias ll='ls -alh'
alias l='ls -lh'
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias free='free -m'
alias git='git --no-pager'

export HISTCONTROL=ignoreboth:erasedups
export CC=gcc

# Use bash-completion, if available. This is not enabled by default on LMDE or Debian.
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
