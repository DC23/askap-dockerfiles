# Check for an interactive session
[ -z "$PS1" ] && return

# fix the default root ownership of the mounted volume
if [ ! -O "${HOME}/code" ]; then
    echo Fixing code volume ownership ...
    sudo chown -R askap:users $HOME/code/
    echo Done
fi

# Set our prompt.
if [ -f "${HOME}/.bash_prompt" ]; then
    source "${HOME}/.bash_prompt"
fi

# Source our custom functions
if [ -f "${HOME}/.bash_functions" ]; then
    source "${HOME}/.bash_functions"
fi

# environment variables
HOSTNAME=`hostname`
export PATH="~/bin:$PATH"
export GREP_COLOR="1;33"
export EDITOR="vim"

# for virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=~/code

# some aliases
alias ls='ls --group-directories-first --color=auto'
alias la='ls -Ah'
alias ll='ls -alh'
alias l='ls -lh'
alias dmls='dmls -lah'
alias bc='bc -l'
alias df='df -h'
alias du='du -h'
alias du1='du --max-depth=1 | sort -hr'
alias du2='du --max-depth=2 | sort -hr'
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias free='free -m'
alias quota='quota -s'
# Git colorisation escape codes don't work with the pager
alias git='git --no-pager'
alias ipyqt='ipython qtconsole --colors=linux --pylab=inline'
alias ipyqtw='ipython qtconsole --pylab=inline'
alias gst='git status'
alias gpr='git pull --rebase'
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias ga='git add'
alias gaa='git add --all'
alias gps='git push'

# lazy typist shortcuts for initialising the ASKAPsoft environment.
if [ -f "${HOME}/code/askapsoft/initaskap.sh" ]; then
    alias ia='source ~/code/askapsoft/initaskap.sh'
    alias cdsms='cd $ASKAP_ROOT/Code/Components/Services/skymodel/service'
fi

# virtualenv wrapper
export PROJECT_HOME=$HOME/code
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
if [ -f "/usr/share/virtualenvwrapper/virtualenvwrapper.sh" ]; then
    source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi

export HISTCONTROL=ignoreboth:erasedups
export CC=gcc

# Use bash-completion, if available. This is not enabled by default
# on LMDE or Debian.
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

export GCC_COLORS=1

# Alias some programs so that they don't spam a console with warnings that I don't care about
if command_exists gvim ; then
    alias gvim='gvim 2>/dev/null'
    #alias gvim-update='gvim +PluginClean +PluginInstall! +qall'
    #alias vim-update='vim +PluginClean +PluginInstall! +qall'
fi

# if we have the tree command, turn colorisation on
if command_exists tree ; then
    alias tree="tree -C"
fi

# Subversion alias for quiet status listings that ignore unversioned files
alias ssq="svn status -q"
