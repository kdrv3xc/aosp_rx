#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1="\[$(tput bold)\]\[\033[38;5;200m\][\[$(tput bold)\]\[\033[38;5;50m\]\u\[$(tput bold)\]\[\033[38;5;200m\]@\[$(tput bold)\]\[\033[38;5;50m\]\h\[$(tput bold)\]\[\033[38;5;200m\]]\[$(tput bold)\]\[\033[38;5;14m\]:\[$(tput bold)\] \[$(tput bold)\]\[$(tput bold)\]\[\033[38;5;200m\]\W\[$(tput bold)\] \[$(tput bold)\]\[$(tput bold)\]\[\033[38;5;14m\]\\$\[$(tput bold)\] \[$(tput sgr0)\]"

source ~/.aliases
source ~/.profile

#export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 2>/dev/null ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end
#source /usr/share/nvm/init-nvm.sh
#source ~/scripts/functions
#onLogin
