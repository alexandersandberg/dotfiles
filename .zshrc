export ZSH="/Users/alex/.oh-my-zsh"

# theme
ZSH_THEME="dracula"

# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/alias.sh

export LC_ALL=en_US.UTF-8

# android development
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# customized based on dracula theme's prompt
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='
${ret_status}%{$fg_bold[green]%}%p %{$fg_bold[blue]%}%c $(git_prompt_info)% %{$reset_color%}
🐨  -->'

# aliases
alias config="code ~/.zshrc"
alias reload="source ~/.zshrc"

alias ..="cd ../"
alias ...="cd ../../"
alias ls="ls -Gp"
alias lsl="ls -l"
alias f='open -a Finder ./'
alias dev="cd ~/dev/"
alias home="cd ~"
alias gh="open https://github.com/alexandersandberg"
alias as="open https://alexandersandberg.com"
alias tw="open https://twitter.com/home"

# git
alias push="git push origin master"
alias pushf="git push origin master -f"
alias gs="git status -s"
alias gl="git log --oneline --decorate"
alias gla="git log --oneline --decorate --all"
alias gr="git reset HEAD~"
alias grs="git reset --soft HEAD~"
alias gp="git remote prune origin"

# react native
alias rni="npx react-native run-ios"
alias rna="npx react-native run-android --variant debug --appIdSuffix debug"
alias rnaab="cd android && ./gradlew bundleRelease && cd .."
alias pi="npx pod-install"

# https://github.com/nvbn/thefuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)