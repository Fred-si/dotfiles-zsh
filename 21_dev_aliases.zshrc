#!/bin/zsh

# Git
alias igt='git'
alias gti='git'

alias gf='git-flow'
alias gff='git-flow feature'

alias pss='php -S localhost:8000 -t public'
alias sss='symfony server:start'
alias con='symfony console'

alias pu='bin/phpunit'
alias puw='phpunit_watch'

[[ $OS_RELEASE == 'Ubuntu' ]] \
    && alias python='python3'
