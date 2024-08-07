# ZSH Prompt
RPROMPT='%F{blue}%D{%L:%M}%f'
PROMPT='%F{green}%~%f %# '

# General variables
export DEV_HOME="$HOME/dev"

# General aliases
alias sz='source $HOME/.zshrc'
alias cdd='cd $DEV_HOME'

# Git aliases
alias g='git'
alias gst='git status'
alias gco='git checkout'
alias gbr='git branch'
alias gcm='git commit -m'
alias gcmsg='git commit -m'
alias gl='git log --oneline --graph --decorate'
alias gpl='git pull'
alias gps='git push'
alias gdc='git diff --cached'
alias gds='git diff'
alias ga='git add'
alias gaa='git add .'
alias grm='git rm'
alias gfa='git fetch --all'
alias gcl='git clone'
alias gb='git bisect'
alias gtag='git tag'
alias grb='git rebase'
alias gm='git merge'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion