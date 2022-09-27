# Command line config
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export KUBECTX_CURRENT_FGCOLOR=$(tput setaf 6) # blue text
export KUBECTX_CURRENT_BGCOLOR=$(tput setab 7) # white background

# Application home directories

#export JAVA_HOME="$(jrunscript -e 'java.lang.System.out.println(java.lang.System.getProperty("java.home"));')"
export JAVA_HOME="$(dirname $(dirname $(readlink -f $(which javac))))"
export JAVA_HOME=$(/usr/libexec/java_home -v1.8)

export MONGO_HOME=/opt/mongo/latest
export M2_HOME=/opt/maven/latest
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$M2_HOME/bin:$MONGO_HOME/bin:/usr/local/go/bin:${GOPATH}/bin
export ETCDCTL_API=3

# aliases to directories
export WORKSPACE=~/Workspace
alias ws='cd $WORKSPACE'
alias ws-personal='cd $WORKSPACE/Personal'

# Maven: command aliases
alias mci='mvn clean install'
alias mci-='mvn clean install -DskipTests'

# Custom bash aliases
[ -f ~/.bash_aliases ] && source ~/.bash_aliases

# K8S: command aliases
#[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
#function kubectl() { echo "+ kubectl $@">&2; read -n 1 -p "Continue [Ctrl-c to exit] ? "; command kubectl $@; }

# Scripts/executables
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Export all paths of pattern /opt/{app}/latest/bin in PATH env variable
for i in `find /opt -maxdepth 2 -type d 2>/dev/null`; do if [ -d "$i/latest/bin" ]; then export PATH=$PATH:$i/latest/bin; fi; done

# Autocomplete ssh/scp commands with list of hosts and their aliases in ~/.ssh/config file
complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,\s]+/)[1..-1].reject{|host| host.match(/\*|\?/)} if $_.match(/^\s*Host\s+/);' < $HOME/.ssh/config)" scp sftp ssh
