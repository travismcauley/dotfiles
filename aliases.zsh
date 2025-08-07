# ===============================================
# TMUX ALIASES
# ===============================================

# Session management
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tk='tmux kill-session -t'
alias tka='tmux kill-server'

# Quick session creation
alias dev='tmux new -A -s dev -c ~/projects'
alias main='tmux new -A -s main'

# Function to create a new tmux session for current project
tmux-project() {
    local session_name=${1:-$(basename $(pwd))}
    tmux new -A -s "$session_name" -c "$(pwd)"
}
alias tp='tmux-project'


# Optional: Auto-attach to tmux on terminal start (uncomment if desired)
# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#     tmux attach -t main || tmux new -s main
# fi

# ===============================================
# DEVELOPMENT ENVIRONMENT HELPERS
# ===============================================

# Open project in tmux with predefined layout
tmux-dev-layout() {
    local session_name="${1:-dev}"
    
    # Create new session with editor window
    tmux new-session -d -s "$session_name" -n editor
    tmux send-keys -t "$session_name:editor" 'nvim .' C-m
    
    # Create server window with splits
    tmux new-window -t "$session_name" -n server
    tmux split-window -t "$session_name:server" -h -p 40
    
    # Create git window
    tmux new-window -t "$session_name" -n git
    tmux send-keys -t "$session_name:git" 'git status' C-m
    
    # Select first window and attach
    tmux select-window -t "$session_name:editor"
    tmux attach-session -t "$session_name"
}
alias tdev='tmux-dev-layout'

# Kill all tmux sessions except the current one
tmux-kill-others() {
    local current_session=$(tmux display-message -p '#S')
    tmux list-sessions -F '#{session_name}' | grep -v "^$current_session$" | xargs -I {} tmux kill-session -t {}
    echo "Killed all sessions except: $current_session"
}
alias tko='tmux-kill-others'

# Shortcuts
alias path='echo -e ${PATH//:/\\n}'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias uuidgen="uuidgen | tr '[:upper:]' '[:lower:]' | pbcopy"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"
alias reloadshell="omz reload"

# List all files colorized in long format
alias l="ls -lF ${colorflag}"

# List all files colorized in long format, excluding . and ..
alias la="ls -lAF ${colorflag}"

# Directories
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd $HOME/code"

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

