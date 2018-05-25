#enable completion
zstyle :compinstall filename '/home/thomas/.zshrc'
autoload -Uz compinit
compinit

#prompt
export PS1="%B%C %%%b "

#autocd
setopt autocd

#enable colors
autoload colors zsh/terminfo
colors

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
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST

#vim
export EDITOR=vim
bindkey -v

#pipe to multiple outputs
setopt MULTIOS

#spell check commands
setopt CORRECT

#zsh bindings
bindkey '^R' history-incremental-search-backward

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
alias gh='git show'
alias glch='git log -n 1 --pretty=format:"%H"' #last commit hash
#cleanup local branches fully merged into master
alias gcl="git branch --merged master | grep -v '^\*\|  master' | xargs -n 1 git branch -d"
alias gcb='git rev-parse --abbrev-ref HEAD' #current branch

#npm aliases
alias ni='npm install'
alias nre='rm -rf node_modules && npm install'
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

#patching aliases
function newb(){
  BRANCH=${1}
  git branch $BRANCH && git checkout $BRANCH && git push --set-upstream origin $BRANCH
}
function newf(){
  BRANCH=`gcb`
  git checkout -b $BRANCH'-changes'
}

#docker aliases
alias dcp='docker container prune'
alias dsp='docker system prune'
alias dvp='docker volume prune'

#backlight aliases
alias screen-off='sleep 1 && xset dpms force off'
alias bed='screen-off && node ~/code/mp3-speaker/index.js && amixer sset 'Master' 25%'

#PIA aliases
alias gerpia='sudo openvpn --config /etc/openvpn/client/Germany.conf'
alias frpia='sudo openvpn --config /etc/openvpn/client/France.conf'
alias enpia='sudo openvpn --config /etc/openvpn/client/UK_London.conf'
alias uspia='sudo openvpn --config /etc/openvpn/client/US_East.conf'

#weather
function wttr(){
  LOCATION=${1}
  curl 'http://wttr.in/\~'$LOCATION
}

#initialize antigen
if [[ ! -f ~/antigen.zsh ]]; then
  echo installing anitgen
  curl -L git.io/antigen > ~/antigen.zsh
fi
source ~/antigen.zsh

#plugins
antigen bundle zsh-users/zsh-autosuggestions

#initialize nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

#initialize tmux
if [ "$TMUX" = "" ]; then tmux; fi

#set wave root
export WAVE_ROOT=~/code/wave

#local bin
PATH=$PATH:/usr/local/bin

#ruby
export GEM_HOME=$HOME/.gem
PATH=$PATH:$(ruby -rubygems -e "puts Gem.user_dir")/bin

#the bin in the home directory should take priority
PATH=$HOME/bin:$PATH
export PATH

