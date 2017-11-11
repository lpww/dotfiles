#compinstall
zstyle :compinstall filename '/home/thomas/.zshrc'
autoload -Uz compinit
compinit

#autocd
setopt autoc

#beep on error
setopt beep

#globs
setopt GLOB_COMPLETE
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt EXTENDED_GLOB

#error if no match
setopt nomatch

#history
SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

#vim
export EDITOR=vim
bindkey -v

#pipe to multiple outputs
setopt MULTIOS

#spell check commands
setopt CORRECT

#subl aliases
alias subl="subl3"

#git aliases
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias go='git checkout'
alias gp='git pull'
alias gk='gitk --all&'
alias gx='gitx --all'
alias gl='git log'
alias gr='git reflog'
alias gf='git fetch'
#cleanup local branches fully merged into master
alias gcl="git branch --merged master | grep -v '^\*\|  master' | xargs -n 1 git branch -d"

#npm aliases
alias ni='rm package-lock.json; npm i; rm package-lock.json'
alias nre='rm -rf node_modules && ni'
alias nt='npm test'
alias nr='npm run'
alias nv='npm version'
alias nli='npm link'
alias nuli='npm unlink'
alias nls='( ls -l node_modules ; ls -l node_modules/@* ) | grep ^l'
alias nu='npm update'
alias ns='npm start'
#list globally installed packages
alias ng='npm list -g --depth=apply'

#docker aliases
alias dcp='docker container prune'
alias dsp='docker system prune'
alias dvp='docker volume prune'

#drive-google
alias drive='drive-google'

#weather
function wttr(){
  LOCATION=${1}
  curl 'http://wttr.in/\~'$LOCATION
}

#initialize nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#The bin in the home directory should take priority
PATH=$HOME/bin:$PATH
export PATH

