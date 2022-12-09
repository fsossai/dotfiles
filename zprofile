# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

export GREP_COLOR='1;35'
export GREP_OPTIONS='--color=always'
export peroni='fsv1684@peroni.cs.northwestern.edu'

alias ll='ls -l --color'
alias more='more -R'
alias less='less -R'
alias peroni='ssh $peroni'
alias vi='nvim'

