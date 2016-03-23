# .bashrc for interactive terminal (for example, sftp)
[ -z "$PS1" ] && return

HISTSIZE=10000
HISTFILESIZE=10000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '
HISTIGNORE=ls:history

# private setting
if [ -f ~/.bashrc.private ]; then
    source .bashrc.private
fi

# インストールしたファイルのパス（環境設定）
export PATH=$HOME/bin:$PATH
export PATH=$HOME/usr/bin:$PATH

#ifconfig等へのパス
export PATH=$PATH:/sbin/

# Required by Makefile for dotfiles. Put something this in your .bashrc or .zshrc
[ -f ~/.path ] && . ~/.path

# emacs を256色で起動する設定。
# emacs が256色で起動出来ているかどうか確認するには、
# emacs M-x から 以下のコマンドを実行しましょう。
# list-color-display
alias emacs='TERM=xterm-256color emacs -nw'

alias la='ls -la --color=always'

# screen自動起動
# すでに screen セッションがある場合そこに接続し、なければ作成する。
screen -xR


# screenの各ウィンドウのタイトルを，コマンド実行中はそのコマンド名に自動で設定し
# そうでなければ現在の作業ディレクトリ名に自動で設定する．
## .bashrc側の設定 (.screenrcの設定も必要)
if [ -n "$STY" ]; then
    export PS1='\u@\h:\W\$ '
    export PROMPT_COMMAND='echo -ne "\033k\033\0134\033k$(basename $(pwd))\033\\"'
else
    export PS1='\u@\h:\W\$ '
fi


######################################################################
##  Setting for Cygwin
######################################################################
if [ $(uname | grep -i "cygwin") ]; then # for Cygwin
# For cocot
alias ifconfig='cocot ipconfig'
alias ping='cocot ping'
alias arp='cocot arp'
alias nslookup='cocot nslookup'
alias traceroute='cocot tracert'
alias route='cocot route'
alias netstat='cocot netstat'

fi
