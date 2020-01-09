# Command line config
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export KUBECTX_CURRENT_FGCOLOR=$(tput setaf 6) # blue text
export KUBECTX_CURRENT_BGCOLOR=$(tput setab 7) # white background

# Application home directories
export JAVA_HOME=$(/usr/libexec/java_home -v1.8)
export MONGO_HOME=/opt/mongo/latest
export M2_HOME=/opt/maven/latest
export GOPATH=$HOME/go
export PATH=$PATH:$M2_HOME/bin:$MONGO_HOME/bin

# aliases to directories
export WORKSPACE=~/Workspace/Personal
alias ws='cd $WORKSPACE'
alias ws-bahubali='cd $WORKSPACE/bahubali'

# Maven: command aliases
alias mci='mvn clean install'
alias mci-='mvn clean install -DskipTests'

# GIT: command aliases
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add --all'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch --delete '
alias gc='git commit'
alias gcm='git commit --message'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcos='git checkout staging'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias grt='git remote -v'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash save'
function glf() { git log --all --grep="$1"; }
function git() { echo "+ git $@">&2; read -n 1 -p "Continue [Ctrl-c to exit] ? "; command git $@; }

# K8S: command aliases
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
function kubectl() { echo "+ kubectl $@">&2; read -n 1 -p "Continue [Ctrl-c to exit] ? "; command kubectl $@; }

# Scripts/executables
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh
