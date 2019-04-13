export LC_ALL=en_US.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PS1='————————————————————————————————————————————————————————————
we @ \[\e[36m\]\w\[\e[m\]
🐨 -->'

# aliases
alias reload="source ~/.bash_profile"

alias ..="cd ../"
alias ...="cd ../../"
alias ls="ls -Glp"
alias lsa="ls -alp"
alias f='open -a Finder ./'
alias dev="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/webdev/"
alias home="cd ~"

# https://github.com/chubin/wttr.in
alias weather='echo "————————————————————"
curl http://wttr.in/{Moon?format=%m,Lulea?format="++++%l:+%c++%t+%2F+%w",Stockholm?format="%l:+%c++%t+%2F+%w"}'

# git
alias push="git push origin master"

# https://github.com/nvbn/thefuck
eval $(thefuck --alias)
