



# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias d='df -ah'


### history customs

export HISTIGNORE="fg*:bg*:history*:cd*:"
HISTIGNORE+="ll:la:l:"
HISTSIZE=10000
#export HISTTIMEFORMAT='%Y%m%d %T';


# git
alias g='git'
alias t='tig'

# Ruby
alias rvm2='rvm use 2.0'
alias rvmjr='rvm use jruby'
alias rvmrbx='rvm use rbx'
alias r='rails'

# Python ### discontinued project
### alias pyvm='pythonbrew'


alias psgrep='ps aux | grep'
alias findgrep='find . -type f | xargs grep -H'
alias llgrep='ll | grep'

# vim
alias v='vim'

# Emacs
alias nw='emacsclient --alternate-editor="" -t'		   # CUI
alias e='emacsclient --alternate-editor="" --create-frame' # GUI
export EDITOR=emacsclient
export VISUAL=emacsclient


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

### self build
export PATH=/usr/local/emacs/bin:$PATH # => 24.2
# testing      build
export PATH=$HOME/git/mruby/bin:$PATH
export PATH=/usr/local/cmake-2.8.10/bin:$PATH

export PATH=/usr/local/llvm-3.1/bin:$PATH
export PATH=/usr/local/llvm-3.2/bin:$PATH
# experimental build
export PATH=$HOME/local/bin:$PATH

###


# sbt0.7.4
export PATH=$HOME/bin:$PATH

# # scala2.8.1.final
# export SCALA_HOME=/opt/scala-2.8.1.final
# PATH=$SCALA_HOME/bin:$PATH

# SVM
export SCALA_HOME=~/.svm/current/rt
export PATH=$SCALA_HOME/bin:$PATH

# NVM
if [ -f ~/.nvm/nvm.sh ]; then
    source ~/.nvm/nvm.sh
    export NODE_PATH=${NVM_PATH}_modules


  # if which nvm >/dev/null 2>&1 ;then
  #   _nodejs_use_version="v0.4.0"
  #   if nvm ls | grep -F -e "${_nodejs_use_version}" >/dev/null 2>&1 ;then
  #     nvm use "${_nodejs_use_version}" >/dev/null
  #     export NODE_PATH=${NVM_PATH}_modules${NODE_PATH:+:}${NODE_PATH}
  #   fi
  #   unset _nodejs_use_version
  # fi
fi

# pythonbrew ### discontinued project
### [[ -s $HOME/.pythonbrew/etc/bashrc ]] && source $HOME/.pythonbrew/etc/bashrc

# virtualenv
export VIRTUALENV_USE_DISTRIBUTE=true
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
