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

# https://github.com/chubin/wttr.in
alias weather='curl http://wttr.in/{Moon\?format="%m",Linz\?format="+++++%l:+%c++%t+%2F+%w",Lulea\?format="++++%l:+%c++%t+%2F+%w",Stockholm\?format="%l:+%c++%t+%2F+%w"}'

# git
alias push="git push origin master"
alias gs="git status -s"
alias gr="git reset HEAD~"
alias grs="git reset --soft HEAD~"
alias gp="git remote prune origin"

# react native
alias rni="react-native run-ios"
alias rna="react-native run-android --variant debug --appIdSuffix debug"

# https://github.com/nvbn/thefuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# functions
typeset -A endDates
endDates=()
countdowns() {
	for k v in "${(@kv)endDates}"
	do
		echo "
$(expr '(' $(date -jf %Y%m%d $k +%s) - $(date +%s) + 86399 ')' / 86400) $v
"
	done
}

today() {
	countdowns
	weather
}

gitall() {
  git add .
  if [ -n "$1" ]
  then
      git commit -m "$1"
  else
      git commit -m update
  fi
  git push
}
