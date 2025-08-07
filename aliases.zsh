# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"
alias path='echo -e ${PATH//:/\\n}'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias uuidgen="uuidgen | tr '[:upper:]' '[:lower:]' | pbcopy"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"
alias reloadshell="omz reload"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, excluding . and ..
alias la="ls -lAF ${colorflag}"

# Directories
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd $HOME/code"
alias rback="cd $HOME/code/rittenlabs/valinor/backend"
alias rfront="cd $HOME/code/rittenlabs/valinor/frontend"

# Python
alias pyls="alias | grep '^py'"
alias pyinit='python3 -m venv .venv && echo "Virtualenv created in .venv/" && source .venv/bin/activate'
alias pyremove='deactivate 2>/dev/null; rm -rf .venv && echo ".venv removed."'

# Git
alias gs="git status"
alias ga="git add ."
alias gc="git add . && git commit -m"

alias glog="git log --oneline --decorate --color"
alias gpull="git pull"
alias gpush="git push"
alias gstash="git stash -u"
alias gwip="commit wip"
alias gbranch="git branch"
alias gcheck="git checkout"
alias gamend="git add . && git commit --amend --no-edit"
alias gunstage="git restore --staged ."

alias gdiff="git diff"
alias gforce="git push --force-with-lease"
alias gnuke="git clean -df && git reset --hard"
alias gpop="git stash pop"
alias gprune="git fetch --prune"

