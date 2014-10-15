# some more ls aliases
alias ll='ls -alhF --color=auto'
alias la='ls -A'
alias l='ls -CF'
function lll ()
{
       command grep --color -E -- "$(ls -rtl $@ | tail -n3)|$" <(ls -l $@)
}

alias tmux='tmux -2'
