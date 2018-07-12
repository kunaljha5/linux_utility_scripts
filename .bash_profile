# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

$HOME/system_information.sh 2>/dev/null

PATH=$PATH:$HOME/.local/bin:$HOME/bin

PS1='[\e[0;96m\D{%T}\e[m] \e[0;92m[\u@\h \e[0;95m\W \e[m$ '
export PATH

