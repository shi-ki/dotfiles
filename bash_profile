if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

export PS1='[\u@\h \[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]]$ '

eval $(gdircolors Dropbox/dotfiles/dircolors.ansi-universal)

source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
