#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup to change terminal colors
if [ -f "$HOME/.dir_colors" ] ; then
    eval $(dircolors -b $HOME/.dir_colors)
fi

# Base16 Shell colorscheme
BASE16_SHELL="$HOME/.config/base16-shell/base16-custom.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Colorize man pages
man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

# cd to full path (instead of soft link)
resolve() {
    cd "`readlink -f .`"
}

# Set the browser for offline arch wiki
export wiki_browser=chromium

shopt -s histappend # append history
alias ls='ls --color=auto'
alias maxima='rlwrap maxima'
alias shutdown='sudo shutdown -h now'
alias hibernate='systemctl hibernate'
alias gotobed='systemctl hibernate'
alias drivepi='sshfs -p 8149 darsor@dapi.bluezone.usu.edu:drive pi'
alias starwars='telnet towel.blinkenlights.nl'
export VISUAL=vim
export EDITOR=vim
export HISTCONTROL=ignoredups

# put ~/.local/bin on the path
export PATH=/home/darsor/.local/bin:$PATH

export SUDO_EDITOR=vim

# GNU Radio
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

