# .bashrc at mtang odyssey
# v 1.1 | 08-18 originally from Samir Amin
#
# If not running interactively, don't do anything
[ -z "$PS1" ] && return
#
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
# if [ ! -f ~/.ssh/id_rsa ]; then
#     echo 'No public/private RSA keypair found.'
#     ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -N ""
#     cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
#     chmod 644 ~/.ssh/authorized_keys
#     echo 'StrictHostKeyChecking no' >> ~/.ssh/config
#     chmod 600 ~/.ssh/config
# fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s histverify
shopt -s checkwinsize

export HISTFILE=~/.history/`date +%Y-%W`.hist
if [[ ! -e $HISTFILE ]]; then
    LASTHIST=~/.history/`ls -tr ~/.history/ | tail -1`
    if [[ -e $LASTHIST ]]; then
        tail -1000 $LASTHIST > $HISTFILE
        # Write a divider to identify where the prior day's session history ends
        echo "##########################################################" >> $HISTFILE
    fi
fi
export HISTSIZE=100000
HISTFILESIZE=1000000

alias hs="history | grep"

PS1="[\u@\h:\w]"

# Set 256 colour terminal when the definition is present.
if [ -e /usr/share/terminfo/x/xterm+256color ]; then
    TERM='xterm-256color'
else
    TERM='xterm-color'
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
  xterm-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
  if [ $(id -u) -eq 0 ]; then # you are root
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[31m\]:\[\033[00;33m\]\w\[\033[00m\]\$ '
  else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;38m\]\u@\h\[\033[00m\]:\[\033[00;38m\]\w\[\033[00m\]\$ '
  fi
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
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

set -o noclobber # prevent overwriting files with cat
set -o ignoreeof # stops ctrl+d from logging me out

## GPG key for krai@mdanderson ##
export GPGKEY=0E32BA1A
#################################
#
# autojump ##
#[[ -s /rsrch2/genomic_med/krai/.autojump/etc/profile.d/autojump.sh ]] && source /rsrch2/genomic_med/krai/.autojump/etc/profile.d/autojump.sh

##snakemake autocomplete
complete -o bashdefault -C snakemake-bash-completion snakemake

## END ##

