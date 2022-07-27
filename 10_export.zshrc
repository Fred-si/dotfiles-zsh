#!/bin/zsh
##############################################################################
[[ -e /usr/bin/nvim ]] \
	&& export EDITOR='/usr/bin/nvim' \
	|| export EDITOR='/usr/bin/vim'

export PAGER="less"
export IMG_VIEWER="sxiv"
export PDF_VIEWER="evince"

# Fichier chargé automatiquement par l'interpréteur python au démarrage
local python_autoloads=${HOME}/.config/bpython/autoloads
[[ -f ${python_autoloads} ]] && export PYTHONSTARTUP=${python_autoloads}

export CORRECT_IGNORE_FILE='.*'

if [[ $HOST == 'frederic' ]]; then
    export NVM_DIR="$HOME/.config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

[[ $HOST == "lysa" ]] && export BATTERY=1

[[ -f /etc/os-release ]] \
    && export OS_RELEASE="$(grep -P '^NAME=' /etc/os-release |cut -d '"' -f 2)"
