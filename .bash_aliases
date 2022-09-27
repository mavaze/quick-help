ns=default

# Alias
alias ws='cd ~/Workspace'

alias k='kubectl -n $ns'
alias x='kubectl -n kube-system'

alias kdl='k delete'
alias kds='k describe'
alias ke='k exec -it'

alias xds='x describe'
alias xdl='x delete'
alias xe='x exec -it'

# Kubernetes Pod
alias kp='k get pods'
alias kp..='kp -oyaml'
alias kp...='kp -owide'
alias kdlp='k delete pod'
alias kdsp='k describe pod'

alias xp='x get pods'
alias xp..='xp -oyaml'
alias xp...='xp -owide'
alias xdsp='xds pods'
alias xdlp='xdl pods'

# Kubernetes Service
alias ks='k get svc'
alias ks..='ks -oyaml'
alias ks...='ks -owide'
alias kdls='k delete svc'
alias kdss='k describe svc'

alias xs='x get svc'
alias xs..='xs -oyaml'
alias xs...='xs -owide'
alias xdss='xds svc'
alias xdls='xdl svc'

# Kubernetes ConfigMap
alias kcm='k get cm'
alias kcm..='kcm -oyaml'
alias kdlcm='k delete cm'
alias kdscm='k describe cm'

alias xcm='x get cm'
alias xcm..='xcm -oyaml'
alias xdscm='xds cm'
alias xdlcm='xdl cm'

# Kubernetes Secret
alias kst='k get secret'
alias kst..='kst -oyaml'
alias kdlst='kdl secret'
alias kdsst='kds secret'

alias xst='x get secret'
alias xst..='xst -oyaml'
alias xdlst='xdl secret'
alias xdsst='xds secret'

# Kubernetes Deployment
alias kdep='k get deployment'
alias kdep..='kdep -oyaml'
alias kdldep='kdl deployment'
alias kdsdep='kds deployment'

alias xdep='x get deployment'
alias xdep..='xdep -oyaml'
alias xdldep='xdl deployment'
alias xdsdep='xds deployment'

# Kubernetes StatfulSet
alias ksf='k get statfulset'
alias ksf..='kdep -oyaml'
alias kdlsf='kdl statfulset'
alias kdssf='kds statfulset'

alias xsf='x get statfulset'
alias xsf..='xdep -oyaml'
alias xdlsf='xdl statfulset'
alias xdssf='xds statfulset'

# Kubernetes Ingress
alias ki='k get ingress'
alias ki..='ki -oyaml'
alias kdli='kdl ingress'
alias xi='x get ingress'
alias xi..='xi -oyaml'

# Kubernetes PersistentVolume
alias kpv='kubectl get pv'
alias kpv..='kpv -oyaml'
alias kdlpv='kubectl delete pv'
alias kdspv='kubectl describe pv'

# Kubernetes PersistentVolumeClaim
alias kpvc='k get pvc'
alias kpvc..='kpvc -oyaml'
alias kdlpvc='k delete pvc'
alias kdspvc='k describe pvc'

alias kl='k log -f'
alias kl10='kl --tail=10'
alias kl100='kl --tail=100'

alias xl='x log -f'
alias xl10='xl --tail=10'
alias xl100='xl--tail=100'

alias knode='kubectl get node -owide'
alias kns='kubectl get ns --all-namespaces'
alias kbindall="kubectl get rolebindings,clusterrolebindings --all-namespaces \
  -o custom-columns='KIND:kind,ROLE:metadata.name,SERVICE_ACCOUNTS:subjects[?(@.kind==\"ServiceAccount\")].name'"

# Helm Aliases
alias h='helm -n $ns'
alias hl='helm ls -n$ns'
# helm upgrade --install RELEASE CHART [--dry-run] --repo <repo-url> --username <plain-text> --password <plain-text> -f <yaml-file-name> --set <key=value> --devel --debug -n <namespace>
alias hu='helm upgrade --install -n$ns --devel --debug'
alias hudry='hu --dry-run'
alias hhist='helm history -n$ns -oyaml'
alias hroll='helm rollback -n$ns'
alias hval='helm get values -n$ns -oyaml'
alias hman='helm get manifest -n$ns'
# helm create <chart-name>
# helm repo add|list|remove|update
# helm rollback

# Functions
function kbash() { k exec -it ${1} -- bash; }

# Find files with matching keyword in provided path 'search <folder path> [<grep options>] keyword'
function search() { find ${1} -type f -exec grep ${2} /dev/null {} \;; }

function who-listens-to-port() { lsof -nP -i4TCP:${1} | grep LISTEN; }

function fixoldcommit() {
   if [[ $(git diff --name-only --cached) ]]; then
      git cat-file -t ${1}
      if [ $? -eq 0 ]; then
         stashed=false
         if [[ $(git diff --name-only) ]]; then
            git stash -k -q
            stashed=true
            echo "stashed files"
         fi
         git commit --fixup=${1}
         git rebase --interactive --autosquash ${1}^
         if test "$stashed" = true; then
            git stash pop -q
            echo "unstashed files"
         fi
       else
         echo "Commit '${1}' does not exist"
       fi
    else
       echo "Files are not added"
    fi
}
