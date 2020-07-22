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

aws-login()
{
    if [[ "${1}" == "corp" ]]; then
    export AWS_SESSION_TTL=4h
    export AWS_ASSUME_ROLE_TTL=4h
    fi

    if [[ "${1}" == "neurotic" || "${1}" == "corp" || "${1}" == "test" || "${1}" == "elemental" || "${1}" == "solidworks" || "${1}" == "iam" ]]; then
    echo "" > "${HOME}/.aws/env-credentials"
    for i in `aws-okta exec $1 -- env`; do
               if [[ `grep AWS <<< $i` ]]; then
               echo "export ${i}" >> "${HOME}/.aws/env-credentials"
        fi
        done
    source "${HOME}/.aws/env-credentials"
    else
        echo "Please specify the role you are assuming first."
        echo "Role        | Permissions:"
        echo "corp        | Full admin on corp account"
        echo "neurotic    | Full admin on Neurotic Media account"
        echo "test        | Full admin on DevOps Test account"
        echo "elemental   | Full admin on Elemental account"
        echo "solidworks  | Full admin on Solidworks account"
        echo "iam         | Full admin on IAM account"
    fi
}

if [ -f "${HOME}/.aws/env-credentials" ]; then
  source "${HOME}/.aws/env-credentials"
fi
