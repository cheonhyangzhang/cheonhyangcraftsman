export NODE_OPTIONS="--max-old-space-size=8192"

# Customized bash prompt to show both local timezone and UTC timezone
export PS1="\u@\H @\T \d:\[$(tput sgr0)\]"
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\n[\$(date)] [\$(date -u)] \n\h:\[\033[32m\]\w\[\033[00m\]\[\033[31m\]\$(parse_git_branch)\[\033[00m\]\$ "

# Support auto completion for git

source ~/git-completion.bash

# Support auto completion for tmux join session
alias tma='tmux attach -t $1'
if [ -f /etc/bash_completion.d/tma ]; then
. /etc/bash_completion.d/tma
fi
alias tml='tmux list-sessions'

# Use fzf search for ctrl + r for command history
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias mcmb='mint clean && mint build'
alias grc='git review create'
alias gru='git review update'
alias gsa='git submit --async'
alias grd='git review dcommit -r'

set -o vi
# set fzf and use fzf search for ctrl + r for command history
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export GRADLE_HOME=$HOME/.gradle/ligradle/gradle-5.2.1

# use vim as the default editor
export VISUAL=vim
export EDITOR="$VISUAL"
