# Basic utilities
alias watch='watch '
alias dud='du -d 1 -h'

# Fancy colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# DevOps Stuff
alias k=kubectl
alias kga='kubectl get pod, deployment, service, ingress, job, cronjob, daemonset'
complete -F __start_kubectl k

ks64(){
    kubectl get secret "$1" -o go-template='{{range $k,$v := .data}}{{printf "%s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'
}