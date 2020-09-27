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

[[ $HOST == "lysa" ]] && export BATTERY=1

# Exporte PATH
local my_path=("${HOME}/scripts" "${0%/*}/script" "${HOME}/.local/bin")
for p in $my_path; do
	if [[ ! "${PATH}" =~ "$p" ]] && [[ -d "$p" ]]; then
		export PATH="${PATH}:$(readlink -f $p)"
	fi
done
