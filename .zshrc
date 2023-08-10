export ZSH="/Users/alexandersandberg/.oh-my-zsh"

export PATH="$HOME/.gem/ruby/3.1.1/bin:$PATH"
export PATH="$HOME/Library/Python/3.11/bin:$PATH"
eval "$(rbenv init - zsh)"

# theme
ZSH_THEME="dracula"

# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8

# fix keybinds
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

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
alias as="open https://alexandersandberg.com"

# node
alias nr="npm run"

# git
alias gc="git checkout"
alias ga="git add ."
alias gap="git add -p"
alias gm="git commit -m"
alias gs="git status -s"
alias gst="git stash"
alias gstp="git stash pop"
alias gl="git log --oneline --decorate"
alias gla="git log --oneline --decorate --all"
alias gps="git push -u origin HEAD"
alias gpst="git push --tags origin"
alias gpl="git pull"
alias gr="git reset HEAD~"
alias grs="git reset --soft HEAD~"
alias gpr="git remote prune origin"
alias gcl="git clean -df"


# other
alias fuspotlight="cd ~/Library/Developer/CoreSimulator/Devices && find . -name com.apple.suggestions.plist -exec plutil -replace SuggestionsAppLibraryEnabled -bool NO {} \";\" && cd ~/Library/Developer/Xcode/UserData/Previews/Simulator\ Devices/ && find . -name com.apple.suggestions.plist -exec plutil -replace SuggestionsAppLibraryEnabled -bool NO {} \";\""
