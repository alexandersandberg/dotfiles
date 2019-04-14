export ZSH="/Users/alex/.oh-my-zsh"

# theme
ZSH_THEME="dracula"

# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

PROMPT='————————————————————
we @ %F{cyan}%d %f
🐨 -->'

# aliases
alias config="atom ~/.zshrc"
alias reload="source ~/.zshrc"

alias ..="cd ../"
alias ...="cd ../../"
alias ls="ls -Gp"
alias lsl="ls -l"
alias f='open -a Finder ./'
alias dev="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/webdev/"
alias home="cd ~"

# https://github.com/chubin/wttr.in
alias weather='echo "——————————————————————————————"
curl http://wttr.in/{Moon\?format="%m",Lulea\?format="++++%l:+%c++%t+%2F+%w",Stockholm\?format="%l:+%c++%t+%2F+%w"}'

# git
alias push="git push origin master"

# https://github.com/nvbn/thefuck
eval $(thefuck --alias)
