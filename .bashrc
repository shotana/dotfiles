# プロンプト
PS1="\[\e[1;34m\]\w\[\e[m\] "

export PROMPT_DIRTRIM=2

# alias
alias emacs='emacsclient -nw -a ""'
alias e='emacs'
alias ekill='emacsclient -e "(kill-emacs)"'
alias fig='docker-compose'
alias g='git'
alias gst='git status'
alias ls='ls -h'
alias ll='ls -l'
alias la='ls -a'
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias cl='clear'
alias vi='vim'
alias grep='grep --color'
alias ytd='youtube-dl -o "%(title)s.%(ext)s"'
alias ytdmp3='youtube-dl -o "%(title)s.%(ext)s" -x --audio-format mp3'
alias diary='emacs ~/diary/$(date "+%Y/%m/%d.md")'

# fzf初期化。入っていない場合はインストール
if which fzf > /dev/null 2>&1; then
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf > /dev/null
  ~/.fzf/install > /dev/null
  source ~/.bashrc
fi

# pyenv
if which pyenv > /dev/null 2>&1; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# rbenv
if which rbenv > /dev/null 2>&1; then
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)"
fi

# gtags with pygments
export GTAGSLABEL=pygments
