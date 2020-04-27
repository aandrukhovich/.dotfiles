# Setup fzf
# ---------
if [[ ! "$PATH" == */home/aandrukhovich/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/aandrukhovich/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/aandrukhovich/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/aandrukhovich/.fzf/shell/key-bindings.zsh"
