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
alias dev="cd ~/webdev/"
alias home="cd ~"
alias gh="open https://github.com/alexandersandberg"

# https://github.com/chubin/wttr.in
alias weather='curl http://wttr.in/{Moon\?format="%m",Lulea\?format="++++%l:+%c++%t+%2F+%w",Stockholm\?format="%l:+%c++%t+%2F+%w"}'

# git
alias push="git push origin master"
alias gs="git status"

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
