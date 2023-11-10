# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b'

setopt PROMPT_SUBST
PROMPT='
🐨 %B%F{blue}%~%f %F{cyan}${vcs_info_msg_0_:+(${vcs_info_msg_0_}) }%f%b%(?:%F{green}✓%f:%F{red}✖%f)
-> '

# Fix history keybinds
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# Aliases
alias config="edit ~/.zshrc"
alias reload="source ~/.zshrc"

alias ..="cd ../"
alias ...="cd ../../"
alias ls="ls -Gp"
alias lsa="ls -a"
alias lsl="ls -l"
alias f='open -a Finder ./'
alias dev="cd ~/dev/"
alias home="cd ~"

alias as="open https://alexandersandberg.com"

alias edit="open -a TextEdit"

alias nr="npm run"

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

alias ghpr="gh pr checkout"

alias fuspotlight="cd ~/Library/Developer/CoreSimulator/Devices && find . -name com.apple.suggestions.plist -exec plutil -replace SuggestionsAppLibraryEnabled -bool NO {} \";\" && cd ~/Library/Developer/Xcode/UserData/Previews/Simulator\ Devices/ && find . -name com.apple.suggestions.plist -exec plutil -replace SuggestionsAppLibraryEnabled -bool NO {} \";\""
