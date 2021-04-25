export ZSH="/home/minish144/.oh-my-zsh"

export ZSH_DISABLE_COMPFIX=true

ZSH_THEME="robbyrussell"

# --- Plugins ---
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
# ---

source $ZSH/oh-my-zsh.sh

# --- Disabling Brew Autoupd ---
export HOMEBREW_NO_AUTO_UPDATE=1
# —---

# --- Aliases ----
alias zshconfig="nano ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh"
alias clr="clear"
alias i3config="nano ~/.i3/config"
alias picomconfig="nano ~/.config/picom/picom.conf"
alias polybarconfig="nano ~/.config/polybar/config"
# —---

# —-— Setting prompt —---
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
# —---

setopt PROMPT_SUBST
# PS1='%B %F{cyan}%1$%f%F{yellow}${vcs_info_msg_0_}%f %b'
PS1=' %B%F{green}$%f%b '

# --- Fix slowness of pastes with zsh-syntax-highlighting.zsh ---
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# --- Disabling path underline style ---
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
