source ~/gcloud/.alias
source ~/git/.alias
source ~/gitpod/.alias
source ~/kubernetes/.alias
source ~/system/.alias 

source ~/gitpod/.functions
source ~/kubernetes/.functions
source ~/dev/.functions
source ~/system/.functions

source ~/kubernetes/.env

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

k8s_info() {
  kubectl config view --minify --output 'jsonpath={..namespace}@{.current-context}' 2> /dev/null
}

## Customizations
PS1="\[\e[1;92m\][\w]\[\e[33m\]\$(parse_git_branch) \[\e[01;33m\][\$(k8s_info)]\[\e[34m\] $>\[\e[96m\] "
