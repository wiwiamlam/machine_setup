#export PS1='\u@\H:\w$ '
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export GONOPROXY="*.byted.org,*.everphoto.cn,git.smartisan.com"
export GONOSUMDB="*.byted.org,*.everphoto.cn,git.smartisan.com"
export GO111MODULE=on
export GOPROXY="https://go-mod-proxy.byted.org|https://goproxy.byted.org|https://goproxy.cn|https://proxy.golang.org|direct"
export GOPRIVATE="*.byted.org,*.everphoto.cn,git.smartisan.com"
export GOSUMDB="sum.golang.org"

GOPATH=$(go env GOPATH)
export PATH=$GOPATH/bin:$PATH
alias grep='ggrep --color=always'
alias less='less -R'
alias v='nvim'
alias tar='gtar'

#git_branch() {
#  branch=" ($(git branch --show-current 2>/dev/null))"
#  echo "$branch"
#}
git_branch() {
  local branch
  # --abbrev-ref HEAD gets the branch name
  # If it's 'HEAD', we aren't on a branch, so we can fallback or leave empty
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

  if [[ -n "$branch" && "$branch" != "HEAD" ]]; then
    echo " ($branch)"
  elif [[ "$branch" == "HEAD" ]]; then
    # Optional: show the short hash if detached
    echo " ($(git rev-parse --short HEAD 2>/dev/null))"
  fi
}
#export PS1="\033[1m\033[32m\u@\H\033[0m\033[0m:\033[1m\033[34m\w\033[0m\033[1;33m\$(git_branch)\033[0m\$ "
#export PS1="\033[36m\][\t] \[\033[32;1m\]\h:\[\033[34;1m\]\w\[\033[33;1m\]\[\$(git_branch)\]\[\033[0m\]\] \$ "
export PS1="\[\033[38;5;231m\][\t] \[\033[38;5;179m\]\h:\[\033[38;5;145m\]\w\[\033[33;1m\]\$(git_branch)\[\033[0m\] \$ "
# \W currency directory \w full path

source ~/.bashrc

#linux
#export PS1="\[\033[36m\][\t] \[\033[32;1m\]\u@\H \[\033[34;1m\]\w\[\033[0m\] \$ "
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
export TERM="xterm-256color"


#source ~/.bashrc_powerline
