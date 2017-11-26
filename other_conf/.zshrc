export ZSH=/root/.oh-my-zsh
ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(git)
source $ZSH/oh-my-zsh.sh
alias ll='ls -lah'
alias gp='grep -rli '
alias gd='git difftool '
alias gs='git status && git status | grep php | awk '\''{print $2}'\'' | xargs -I '{}' php -l ./'{}''
alias gcm='git commit -a -m '
alias gck='git checkout '
alias push='git push origin '

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8 
export TERM="xterm-256color"

export EDITOR="/usr/bin/vim"
export PATH=$PATH:/usr/local/openresty/bin/ 

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=1
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
