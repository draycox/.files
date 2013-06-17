
alias list='cd ~/src/Personal/list'
alias P='cd ~/Projects/portals'
alias gitx="gitx --all"
alias gst='git status'
alias gd='git diff $1'
alias gca='git commit -a'
alias gco='git checkout $1'
alias gpr='git pull --rebase'
alias gitme='git log origin/master..master'
alias ops='ssh dcox@ops01.pacloud.net'

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
WHITE="\[\033[0;39m\]"
BLUE="\[\033[0;34m\]"

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "_∆_"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PS1="\n$RED\w$YELLOW \$(parse_git_branch)$WHITE\n\$ "

export PATH=/usr/local/bin:/usr/local/mysql/bin:$PATH
PATH=$PATH:$HOME/bin:$HOME/.rvm/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
