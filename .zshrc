autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh

#setopt PROMPT_SUBST
#PROMPT='%F{green}%n@%M%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

alias cp='cp -i'                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less
alias np='nano -w PKGBUILD'
alias rm='rm -i'

HISTFILE=~/.zshhist
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
