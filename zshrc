#
# ZSH plugins
#
source "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "${HOMEBREW_PREFIX}/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "${HOMEBREW_PREFIX}/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"

    autoload -Uz compinit
    compinit
fi

#
# ALIAS
#

alias ..='cd ..'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias zshrc='code ~/.zshrc'
alias zshrcs='source ~/.zshrc'
alias ngz='npm i && npm run build:libs && npm run start'

alias cdg='cd $HOME/src/gitlab/gdk/gitlab'
alias cdd='cd $HOME/src/zephyr/zephyr-front-end'
alias vsg='code $HOME/src/gitlab/gdk/gitlab'
alias vsd='code $HOME/src/zephyr/zephyr-front-end'

sipep() { (sipep-down && sipep-infra-down && sipep-up && sipep-infra-up && cd $HOME/src/ufg && code sipep.code-workspace) }
sipep-up() { (cd $HOME/src/ufg/sipep && docker compose up -d  --build) }
sipep-down() { (cd $HOME/src/ufg/sipep && docker compose down) }
sipep-infra-up() { (cd $HOME/src/ufg/sipep-infra && docker compose up -d --build) }
sipep-infra-down() { (cd $HOME/src/ufg/sipep-infra && docker compose down) }
sipep-app() { (cd $HOME/src/ufg/sipep-app && npm i && npm run dev) }

#
# ASDF
#
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

#
# ZSH prompt
#
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
#PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '