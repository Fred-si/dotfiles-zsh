#!/bin/zsh

export CORRECT_IGNORE_FILE='.*'

[[ $HOST == "lysa" ]] \
    && export BATTERY=1

# Tools
export PAGER="less"
export IMG_VIEWER="sxiv"
export PDF_VIEWER="evince"

where nvim > /dev/null \
	&& export EDITOR='/usr/bin/nvim' \
	|| export EDITOR='/usr/bin/vim'

# Fichier chargé automatiquement par l'interpréteur python au démarrage
where bpython > /dev/null \
    && local autoloads="${XDG_CONFIG_HOME}/bpython/autoloads" \
    && [[ -f ${autoloads} ]] \
    && export PYTHONSTARTUP=${autoloads} \
    ; unset autoloads

# NVM
if [[ -d "${XDG_CONFIG_HOME}/nvm" ]]; then
    export NVM_DIR="${XDG_CONFIG_HOME}/nvm"

    [[ -s "$NVM_DIR/nvm.sh" ]] \
        && source "$NVM_DIR/nvm.sh"

    [[ -s "$NVM_DIR/bash_completion" ]] \
        && source "$NVM_DIR/bash_completion" 
fi

