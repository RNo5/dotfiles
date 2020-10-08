# .bashrc for interactive terminal (for example, sftp)
[ -z "$PS1" ] && return

#stop terminal output lock (Ctrl + S)
stty stop undef

export SCREENDIR=$HOME/.screen

# screen自動起動
# すでに screen セッションがある場合そこに接続し、なければ作成する。
screen -xR

HISTSIZE=10000
HISTFILESIZE=10000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '
HISTIGNORE=ls:history

# private setting such as proxy
if [ -f ~/.bashrc.private ]; then
    source ~/.bashrc.private
fi

# インストールしたファイルのパス（環境設定）
export PATH=$HOME/bin:$PATH
export PATH=$HOME/usr/bin:$PATH

#ifconfig等へのパス
export PATH=$PATH:/sbin/

export PATH="$HOME/.rbenv/bin:$PATH"
if type -P rbenv >/dev/null ; then
    eval "$(rbenv init -)"
fi

export PATH="$HOME/work/pcutools/tools/:$PATH"


LD_LIBRARY_PATH=$HOME/usr/lib64/:$HOME/usr/lib/$LD_LIBRARY_PATH:/usr/local/lib
export LD_LIBRARY_PATH

PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/usr/lib64/pkgconfig/:$HOME/usr/lib/pkgconfig/
export PKG_CONFIG_PATH


alias python='/usr/bin/python3'
export PYTHONPATH=$HOME/usr/lib/python2.7/site-packages:$PYTHONPATH
export PYTHONPATH=$HOME/usr/lib/python3.4/site-packages:$PYTHONPATH
export PYTHONPATH=$HOME/usr/lib/python3.6/site-packages:$PYTHONPATH


# global, gtags,
# export GTAGSCONF=/usr/local/share/gtags/gtags.conf
export GTAGSLABEL=pygments


# Required by Makefile for dotfiles. Put something this in your .bashrc or .zshrc
[ -f ~/.path ] && . ~/.path

# emacs を256色で起動する設定。
# emacs が256色で起動出来ているかどうか確認するには、
# emacs M-x から 以下のコマンドを実行しましょう。
# list-color-display
alias emacs='TERM=xterm-256color emacs -nw'

# change colors for ls command
#DIRCOLORS_FILE=$HOME/dotfiles/dircolors.256dark
DIRCOLORS_FILE=$HOME/dotfiles/dircolors.ansi-dark
if [ -f $DIRCOLORS_FILE ] &&  type -P dircolors >/dev/null ; then
    eval `dircolors -b $DIRCOLORS_FILE`
else
    export LS_COLORS='di=00;33'
fi
alias la='ls -lah --color=always'
alias ..='cd ..'
alias ...='cd ../..'

if type -P emacs >/dev/null ; then
    export EDITOR=emacs
fi


# screenの各ウィンドウのタイトルを，コマンド実行中はそのコマンド名に自動で設定し
# そうでなければ現在の作業ディレクトリ名に自動で設定する．
## .bashrc側の設定 (.screenrcの設定も必要)
if [ -n "$STY" ]; then
    export PS1='\[\e[0;36m\]\u@\h:\W\$ \[\e[00m\]'
    export PROMPT_COMMAND='echo -ne "\033k\033\0134\033k$(basename "$(pwd)")\033\\"'
else
    export PS1='\[\e[0;36m\]\u@\h:\W\$ \[\e[00m\]'
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

# X server for WSL
#export DISPLAY=localhost:0.0
