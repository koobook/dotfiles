#            _
#     _______| |__  _ __ ___
#    |_  / __| '_ \| '__/ __|
#   _ / /\__ \ | | | | | (__
#  (_)___|___/_| |_|_|  \___|
#
#

###--export--###
export LANG=ja_JP.UTF-8 # 文字コードをUTF-8に設定
export EDITOR=vim
export PATH="/anaconda3/bin:$PATH"

###--setopt--###
setopt IGNOREEOF # Ctrl+Dでログアウトしてしまうことを防ぐ
setopt share_history # 他のシェルのヒストリをリアルタイムで共有する
setopt histignorealldups # ヒストリーに重複を表示しない
setopt auto_cd # ディレクトリ名の入力のみでcd
setopt auto_pushd # cd時にディレクトリスタックにpushdする
setopt pushd_ignore_dups
setopt correct # コマンドのスペルを訂正する
setopt no_flow_control # Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt brace_ccl # 例 : mkdir {1-3} で フォルダ1, 2, 3を作れる

###--history--###
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

###--alias--###
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'
alias lst='ls -ltrG'
alias l='ls -ltrG'
alias la='ls -AG'
alias ll='ls -lG'
alias so='source'
alias v='vim'
alias c='cdr'
alias h='fc -lt '%F %T' 1'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='c ../'
alias back='pushd'
alias diff='diff -U1'

###--color--###
autoload -Uz colors
colors

###--prompt--###
PROMPT="
%{$fg[magenta]%}%~%{$reset_color%} %{$fg[white]%}[%{$reset_color%}%{$fg[cyan]%}%m%{$reset_color%}%{$fg[white]%}]%{$reset_color%}
%{$fg[yellow]%}>>>%{$reset_solor%} "

###--completion--###
# 補完
autoload -Uz compinit
compinit
# 補完後、メニュー選択モードになり左右キーで移動が出来る
zstyle ':completion:*:default' menu select=2
# 補完で大文字にもマッチ
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# コマンドを途中まで入力後、historyから絞り込み
# 例 ls まで打ってCtrl+pでlsコマンドをさかのぼる、Ctrl+bで逆順
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:options' description 'y'

###--function--###
chpwd() { ls -lAG} # after 'cd', run 'ls -lAG'

function mkcd() { # run concurrently 'mkdir' and 'cd'
  if [[ -d $1 ]]; then
    echo "$1 already exists!"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}

function command_not_found_handler(){ # if you make a typo...
    echo -e     "\e[31m               __      ___                       __ \n" \
                ".-----.-----.|  |_  .'  _|.-----.--.--.-----.--|  |\n" \
                "|     |  _  ||   _| |   _||  _  |  |  |     |  _  |\n" \
                "|__|__|_____||____| |__|  |_____|_____|__|__|_____|\n"
}

###--git--###
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT="${vcs_info_msg_0_}"
