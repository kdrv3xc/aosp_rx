# The following lines were added by compinstall

zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' completer _list _complete _ignored _match _correct _approximate
zstyle ':completion:*:approximation:*' completer _ignored _approximate
zstyle ':completion:*' format 'hit tab again, buddy - %d '
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors '{199}{014}{015}'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]}' 'r:|[._]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*:approximation:*' matcher-list '+' '+m:{[:lower:]}={[:upper:]}' 'r:|[._]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*:approximation:*' max-errors 3
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' original false
zstyle ':completion:*' prompt 'you fucked up %e times, good buddy'
zstyle ':completion:*:approximation:*' prompt 'you fucking up this many times: %e'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/primes/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd #extendedglob
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
source /home/primes/.aliases

PROMPT='%F{014}%B[%F{199}%n@%m%F{014}]:%F{white}>%b%f'
RPROMPT='%B%F{014}%~%F{white}[%F{199}%T%F{015}]'

#[[ $- != *i* ]] && return

## pip bash completion start
#_pip_completion()
#{
#    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
#                   COMP_CWORD=$COMP_CWORD \
#                   PIP_AUTO_COMPLETE=1 $1 2>/dev/null ) )
#}
#complete -o default -F _pip_completion pip
## pip bash completion end

#[[ -e "/home/primes/lib/oci_autocomplete.sh" ]] && source "/home/primes/lib/oci_autocomplete.sh"

source ~/.aliases
source ~/.profile
#export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
alias ls='ls --color=auto'


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

neofetch
#source /usr/share/nvm/init-nvm.sh
