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
alias pu='bin/phpunit'
alias puw='phpunit_watch'

alias test_executable='zwatch' # uniquement là pour une question de rétrocompatibilité
alias zw='zwatch'

# Python
[[ $OS_RELEASE == 'Ubuntu' ]] \
    && alias python='python3'

alias remove_cython='rm -rf ~/.cache/JetBrains/**/cythonExtensions'

# Docker
alias dr='docker run'
alias di='docker run -it'

alias dc='docker-compose'
alias dcu='dc up -d'
alias dce='dc exec'
alias dcd='dc down --remove-orphans'

alias dr='dcd; dcu'
alias drb='dcd; dc up -d --build'
alias drbf='dc up -d --always-recreate-deps --force-recreate --build'
alias dcc='dc down --remove-orphans --rmi all --volumes'
