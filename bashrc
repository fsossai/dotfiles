MACHINE='computer'
PS1='╭╴\[\033[01;32m\]\u\033[01;34m@\033[0m\$?:\033[01;35m${MACHINE}:\[\033[01;34m\]\w\[\033[00m\]\n╰╼$ \[\e[0m\]'

export PATH="$LLVM_HOME/bin:$PATH"
export LLVM_HOME="/home/software/llvm"
export LD_LIBRARY_PATH="$LLVM_HOME/lib:$LD_LIBRARY_PATH"
export VIMINIT="source ~/.vimrc"
export GREP_COLOR='1;35'

alias llk='ls -l --block-size=K'
alias llm='ls -l --block-size=M'
alias ta="tmux attach -t"
alias tl="tmux ls"
alias hist="awk '{a[\$0]++} END{ for(k in a) { print k,a[k] } }' | sort -rnk 2 | column -t"

