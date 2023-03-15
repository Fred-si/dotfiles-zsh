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
alias dce='dc exec'
alias drb='docker-compose down; docker-compose up -d --build'
alias dcd='docker-compose down --remove-orphans'
alias dcu='docker-compose up -d'
alias dce='docker-compose exec'
