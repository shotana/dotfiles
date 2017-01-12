autoload -Uz colors
colors

PROMPT='%F{cyan}%~%f '

# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完時に重複した文字を消す
setopt complete_in_word

# * で全ファイル補完をしない
setopt glob_complete

# beep を無効にする
setopt no_beep

# ディレクトリ名だけでcdする
setopt auto_cd

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zhistory
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
# historyを共有
setopt share_history
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space
# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify
# 余分な空白は詰めて記録
setopt hist_reduce_blanks
# 古いコマンドと同じものは無視
setopt hist_save_no_dups
# historyコマンドは履歴に登録しない
setopt hist_no_store

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

export PATH=$PATH:~/bin

# alias
alias emacs='emacsclient -nw -a ""'
alias e='emacs'
alias ekill='emacsclient -e "(kill-emacs)"'
alias fig='docker-compose'
alias g='git'
alias gst='git status'
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -ahl'
alias less='less -MiR'
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias cl='clear'
alias vi='vim'
alias a='atom .'
alias grep='grep --color'
alias ytd='youtube-dl -o "%(title)s.%(ext)s"'
alias ytdmp3='youtube-dl -o "%(title)s.%(ext)s" -x --audio-format mp3'
alias diary='emacs ~/diary/$(date "+%Y/%m/%d.md")'
alias af='anyframe-widget-select-widget'

# fzf初期化。入っていない場合はインストール
if [ -f ~/.fzf.zsh ]; then
  # agが入っていればagを使う
  if [ -x "`which pdftk `" ]; then
    export FZF_DEFAULT_COMMAND='ag -g ""'
  fi
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf > /dev/null
  ~/.fzf/install > /dev/null
  export PATH=$PATH:~/.fzf/bin
  source ~/.zshrc
fi

# zplug
if [ ! -f ~/.zplug/bin/zplug-env ]; then
  curl -sL zplug.sh/installer | zsh
fi

source ~/.zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "mollifier/anyframe"

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose >/dev/null

# anyframe
bindkey '^x' anyframe-widget-cdr
