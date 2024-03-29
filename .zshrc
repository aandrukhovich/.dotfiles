# If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="sunrise"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# source $ZSH/oh-my-zsh.sh
alias ohmyzsh="vim ~/.oh-my-zsh"


autoload -U colors && colors
setopt promptsubst

# Mac colors
start_gray_background='%K{254}'
end_background='%k'
# exitstatus_ps1='%F{red}%F{black}$(echo $?)%f%k'
exitstatus_ps1='%{$fg_bold[red]%}%(?..%? )%{$reset_color%}'
time_date_ps1='%B%F{green}%D{%H:%M:%S %d-%m-%y}'
dir_ps1='%U%F{blue}`pwd`%E%k%u'
end_ps1='%F{cyan}> %b%f'
newline=$'\n'
export PROMPT="$exitstatus_ps1$start_gray_background$time_date_ps1 $dir_ps1$end_background${newline}$end_ps1"

# Linux colors
# start_gray_background='%K{254}'
# end_background='%k'
# exitstatus_ps1='%K{red}%F{black}$(exitstatus)%f%k'
# time_date_ps1='%B%F{green}%D{%H:%M:%S %d-%m-%y}'
# dir_ps1='%U%F{blue}`pwd`%E%k%u'
# end_ps1='%F{cyan}> %b%f'
# newline=$'\n'
# export PROMPT="$exitstatus_ps1$start_gray_background$time_date_ps1 $dir_ps1$end_background${newline}$end_ps1"


# Auto run fzf
source ~/.fzf.zsh

# python
alias p3='ipython3'
# alias pylint='pylint --max-line-length=100'
# alias pylint3='/home/aandrukhovich/snap/pylint3 --max-line-length=100'

# tmux aliases
alias ta='tmux a'
alias tl='tmux list-sessions'

# vim
export EDITOR="vim"


# Ubuntu alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Auto change directory
setopt AUTO_CD

# Save timestamp, uet and elapsed time of command in .zsh_history
# setopt EXTENDED_HISTORY
SAVEHIST=50000
HISTSIZE=20000
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY

# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS


# Enable zsh correction
setopt CORRECT
setopt CORRECT_ALL

# Enable zsh completion
autoload -Uz compinit && compinit


# Enable extended globbing (ls *.(sh|config))
autoload extendedglob


# ls aliases
alias ls="ls -G"
alias llsd='ls -ld *(-/DN)'
alias lsd='ls -ld */'
alias lt='l -tr'
alias llt='ls -alFtr'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -l'
alias lst='< ls -t | head -n 1'

# more informative less
alias less='less -M'

# auto reconnect
alias wget='wget -c'

# comments with #
setopt interactive_comments

# Ubuntu copy-paste
# alias -g xcopy='xclip -selection clipboard'
# alias -g xpaste='xclip -selection clipboard -o'

# Rust-lang
export PATH="$HOME/.cargo/bin:$PATH"
alias cb="cargo build"
alias cr="cargo run"

# alias vim="nvim"

# Vim-mode
export KEYTIMEOUT=1


# Mac M1
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH=$PATH:~/.vim/compiler
# export PATH=/opt/homebrew/bin:$PATH
# pip3 python bin to path
# export PATH=$PATH:$HOME/Library/Python/3.8/bin
# export PATH=$PATH:/opt/homebrew/opt/llvm/bin:
# export PATH=$PATH:/Users/aa/Library/Python/3.9/biN

# alias bat="bat --theme=OneHalfLight"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Linux copy file to clipboard
alias cv="xclip -sel c <"

# Linux core temperature
# alias cput="watch -n 0.5 \"sensors | grep °C\""

# Mac os temperature
# sudo powermetrics --samplers smc -i 1000 |grep -i "CPU die temperature"

alias grep="grep --color=auto"

# pip zsh completion
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip3
