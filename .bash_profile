# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
#export PATH

# path
# export PATH="/usr/bin/:/anaconda3/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:"

export PATH="/usr/bin/:/usr/local/bin:/bin:/usr/sbin:/sbin:~/go/bin/:~/bin/"

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
#export PATH


#export PS1="\[\e[36m\]\u\[\e[m\]@\[\e[32m\]\h:\[\e[m\]\[\e[33m\]\t\[\e[m\]~$ "
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
export TERM=xterm-256color


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# added by Anaconda3 5.0.1 installer
#  export PATH="/anaconda3/bin:$PATH"

# added by Anaconda3 5.0.1 installer
#  export PATH="/Users/jon.mann/anaconda3/bin:$PATH"

gam() { "/Users/jon.mann/bin/gam/gam" "$@" ; }
alias console='screen /dev/cu.USA19H145P1.1'
