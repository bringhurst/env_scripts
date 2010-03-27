##
## Jon B's bashrc stuff
##

# Set the look of the prompt itself
if [ "`id -u`" -eq 0 ]; then
  PS1='>\w# '
else
  PS1='>\w$ '
fi

# Set a more sane term type
TERM=xterm

# Don't wait for job termination notification
set -o notify

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# Add some dirs to the path
export PATH=$PATH:/opt/JSLint/bin:/opt/Spidermonkey/bin:/cygdrive/c/apache-ant-1.6.5/bin/:/cygdrive/c/lint4j-0.9.1/bin:/opt/SpiderMonkey/bin:/cygdrive/c/h/I3CMT/bin

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
case $- in
  *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
esac

# Don't put duplicate lines in the history.
HISTCONTROL="ignoredups"

# Ignore some controlling instructions
HISTIGNORE="[   ]*:&:bg:fg:exit"

# Whenever displaying the prompt, write the previous line to disk
PROMPT_COMMAND="history -a"

# Some shortcuts for different directory listings
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -alh'                       # long list
alias l='ls -CF'                              #
alias jsl='jsl -conf /cygwin/etc/jsl.conf'
alias ..='cd ..'
alias ...='cd ../..'
alias h="history"
alias ps="ps -W"
alias diff="diff -y --side-by-side"

# BEAWLS related aliases
alias logdir="cd /Oracle/Middleware/user_projects/domains/I3/servers/I3Server/logs"
alias cachedir="cd /Oracle/Middleware/user_projects/domains/I3/servers/I3Server/tmp"

# Feature team related aliases
alias sft="ssh sysadmin@featureteam03"
alias sft6="ssh sysadmin@featureteam06"
alias sft3win="ssh ft3win"

# Cygwin stuff
CygwinHome='/cygdrive/c/cygwin' 
nodosfilewarning="true"
CYGWIN="nontsec nodosfilewarning"

# Stuff for git repos
GIT_SSL_NO_VERIFY=1
GIT_CURL_VERBOSE=0

# Point proxies to Cntlm.
RSYNC_PROXY=http://localhost:3128/
HTTP_PROXY=http://localhost:3128/
HTTPS_PROXY=http://localhost:3128/
http_proxy=http://localhost:3128/
https_proxy=http://localhost:3128/

export TERM CYGWIN HISTCONTROL HISTIGNORE PROMPT_COMMAND CygwinHome RSYNC_PROXY HTTP_PROXY HTTPS_PROXY http_proxy https_proxy nodosfilewarning GIT_SSL_NO_VERIFY GIT_CURL_VERBOSE

# Set a title with the current program name.
function settitle() { echo -ne "\[\e]2;$@\a\e]1;$@\a]"; }

# A nifty little calculator helper.
function calc() { awk "BEGIN{ print $* }"; }

