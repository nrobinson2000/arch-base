# Set prompt
export PS1="\[$(tput setaf 6)\]\[$(tput bold)\]\t \[$(tput setaf 2)\]\h \[$(tput setaf 4)\]\[$(tput bold)\]\w \\$ \[$(tput sgr0)\]"

# Set terminal title
export PS1="\[\e]0;\w\a\]$PS1"

export GPG_TTY=$(tty)
export EDITOR="vim"

# Make aliases work with sudo
alias sudo="sudo "

# ls
alias la="ls -A"
alias lh="ls -lah"
alias l="ls"
alias ll="ls -la"

# pushd/popd
alias pu="pushd"
alias po="popd"

# General
alias ..="cd .."
alias p="pacman"
alias py="python3"

# git
alias pull="git pull"
alias skip-ci="update '[skip ci]'"

# Application specific
alias ytm='ytfzf -ml'

# Add, commit and push all changes in a git repo
function update() {
  cd "$(pwd)"
  git add -A
  git commit -m "$1 at $(date +"%H:%M") of $(date +"%Y-%m-%d")"
  # Replace the line above with the following for GPG signed commits
  # git commit -S -m "$1 at $(date +"%H:%M") of $(date +"%Y-%m-%d")"
  git push -u origin $(git rev-parse --abbrev-ref HEAD)
}

# Run a command and copy the output to the clipboard
clip() { # Ex: clip ls -la
  $@ | xclip -selection "clipboard"
}
