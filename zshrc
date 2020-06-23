export ZSH=~/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh_reload)
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
source $ZSH/oh-my-zsh.sh

# Aliases
## pacman
alias pacs="sudo pacman -S"
alias pacss="sudo pacman -Ss"
alias pacsyu="sudo pacman -Syu"
alias pacrs="sudo pacman -Rs"

## tar
alias tarc="tar -cvaf"
alias taruc="tar -xvf"

## ls
alias l="ls -X --color=always"

## fzf (global)
alias z='cd $(fd -j 8 -HI -t d . / | fzf --reverse --border --preview="ls -al {} --color")'
alias x='fd -j 8 -HI . / | fzf --reverse --border --preview="ls -al {} --color" | xclip -selection c'
alias c='code $(fd -j 8 -HI . / | fzf --reverse --border)'

## fzf (local)
# alias a='cd $(fd -j 8 -HI -t d . . | fzf --reverse --border --preview="ls -al {} --color")'
# alias s='fd -j 8 -HI . . | fzf --reverse --border | xclip -selection c'
# alias d='code $(fd -j 8 -HI . . | fzf --reverse --border)'

# Powerlevel10k stuff
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
