
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export ACTIVE_GIT_ACC=$(gitacc active a)
gitacc login $ACTIVE_GIT_ACC