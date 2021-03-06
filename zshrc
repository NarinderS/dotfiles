# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=~/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh_reload zsh-syntax-highlighting zsh-autosuggestions)
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
source $ZSH/oh-my-zsh.sh

# Aliases
## pacman
alias pin="sudo pacman -S"
alias pse="sudo pacman -Ss"
alias pup="sudo pacman -Syu"
alias prm="sudo pacman -Rs"

## tar
alias tarc="tar -cvaf"
alias taruc="tar -xvf"

## ls
alias ls="exa -F --color=always"

## fzf (global)
alias Z='cd $(fd -j 32 -HI -t d . / | fzf --reverse --border --preview="ls -alh {} --color")'
alias X='fd -j 32 -HI . / | fzf --reverse --border --preview="ls -alh {} --color" | xclip -selection c'
alias C='code $(fd -t f -j 32 -HI . / | fzf --reverse --border)'

## fzf (local)
alias z='cd $(fd -j 32 -HI -t d . ${HOME} | fzf --reverse --border --preview="ls -alh {} --color")'
alias x='fd -j 32 -HI . ${HOME} | fzf --reverse --border --preview="ls -alh {} --color" | xclip -selection c'
alias c='code $(fd -t f -j 32 -HI . ${HOME} | fzf --reverse --border)'

# kitten terminal icat
alias icat="kitty +kitten icat"

# datetime
alias datetime='date +"%Y_%m_%d_%I_%M_%p"'

# ZSH Syntax highlighting stuff
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [ -e /home/a/.nix-profile/etc/profile.d/nix.sh ]; then . /home/a/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
