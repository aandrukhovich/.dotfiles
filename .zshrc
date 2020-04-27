# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/aandrukhovich/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="jreese"
ZSH_THEME="sunrise"

# Set list of themes to pick from when loading at random

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"




# PROMPT
force_color_prompt=yes
exitstatus()
{
    RETURN=$?
    if [[ ${RETURN} == 0 ]]; then
        echo ""
    else
        echo "\$${RETURN} "
    fi
}

start_gray_background='%K{254}'
end_background='%k'
exitstatus_ps1='%K{red}%F{black}$(exitstatus)%f%k'
time_date_ps1='%B%F{green}%D{%H:%M:%S %d-%m-%y}'
dir_ps1='%U%F{blue}`pwd`%E%k%u'
end_ps1='%F{cyan}> %b%f'
newline=$'\n'
export PROMPT="$exitstatus_ps1$start_gray_background$time_date_ps1 $dir_ps1$end_background${newline}$end_ps1"


# Auto run fzf
source ~/.fzf.zsh

# python
alias p='ipython2'
alias p3='ipython3'
alias pylint='pylint --max-line-length=100'
alias pylint3='/home/aandrukhovich/snap/pylint3 --max-line-length=100'

# tmux aliases
alias ta='tmux a'
alias tl='tmux list-sessions'

# vim
export EDITOR="vim"
export PATH="$PATH:~/.vim/compiler"


# Ubuntu alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Amazing slackify by kolesov93
alias slackify='~/libs/slackify'


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
alias llsd='ls -ld *(-/DN)'
alias lsd='ls -ld */'
alias lt='l -tr'
alias llt='ls -alFtr'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -l'

# more informative less
alias less='less -M'


# auto reconnect
alias wget='wget -c'


# comments with #
setopt interactive_comments


# copy-paste
alias -g xcopy='xclip -selection clipboard'
alias -g xpaste='xclip -selection clipboard -o'


# Rust-lang
export PATH="$HOME/.cargo/bin:$PATH"
alias cb="cargo build"
alias cr="cargo run"

# Yandex part

export YT_POOL=voice
export YT_PROXY=hahn
export YQL_TOKEN="AQAD-qJSJsASAAADvlzaYSQSwEiVmVwwSyIwOo4"

