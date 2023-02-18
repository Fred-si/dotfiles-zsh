#!/usr/bin/zsh

# Git
alias igt='git'
alias gti='git'

alias gf='git-flow'
alias gff='git-flow feature'

# PHP
alias pss='php -S localhost:8000 -t public'
alias sss='symfony server:start'
alias con='symfony console'

# uniquement là pour une question de rétrocompatibilité
alias test_executable='zwatch'

alias zw='zwatch'
alias pu='bin/phpunit'
alias puw='phpunit_watch'

# Python
[[ $OS_RELEASE == 'Ubuntu' ]] \
    && alias python='python3'
alias remove_cython='rm -rf ~/.cache/JetBrains/**/cythonExtensions'

# Docker
alias dc='docker-compose'
alias dce='dc exec'
alias drb='docker-compose down && docker-compose up -d --build'
alias dcd='docker-compose down --remove-orphans'
alias dcu='docker-compose up -d'
alias dce='docker-compose exec'
