#!/bin/zsh
export CORRECT_IGNORE_FILE='.*'

# Fichier chargé automatiquement par l'interpréteur python au démarrage
if where bpython > /dev/null; then
    local autoloads="${XDG_CONFIG_HOME}/bpython/autoloads" \
        && [[ -f ${autoloads} ]] \
        && export PYTHONSTARTUP=${autoloads}
    unset autoloads
fi

# NVM
if [[ -d "${XDG_CONFIG_HOME}/nvm" ]]; then
    export NVM_DIR="${XDG_CONFIG_HOME}/nvm"

    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" 
fi

[[ $HOST == "lysa" ]] && export BATTERY=1

# Tools
export PAGER="less"
export IMG_VIEWER="sxiv"
export PDF_VIEWER="evince"

if where nvim > /dev/null; then
	export EDITOR='/usr/bin/nvim'
else
	export EDITOR='/usr/bin/vim'
fi
