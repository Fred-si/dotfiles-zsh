#!/bin/env zsh
#
# Ajoute les ligne du fichier $HISTFILE à $HISTFILE.bak.
#
# Si $HISTFILE.bak n’existe pas, il sera créé.

local -Ar ERRORS=('environment_not_set' 1
                  'file_not_found' 10)

if [[ -z $HISTFILE ]]; then
    echo 'Error: environment variable $history_file is empty.' \
        'You need to setup it in your .zshenv'
    exit ${ERRORS['environment_not_set']}
fi

local -r history_file="${HISTFILE:A}"
local -r backup_file="${history_file}.bak"

if [[ ! -e "${history_file}" ]]; then
    echo "Error: file \"${history_file}\" not exist."
    exit ${ERRORS['file_not_found']}
fi

if [[ ! -e "${backup_file}" ]]; then
    cat "${history_file}" > "${backup_file}"
    exit 0
fi

local last_timestamp=$(grep -aP '^: \d{10}:\d+;' ${backup_file} |tail -n 1)
last_timestamp=${last_timestamp[3,12]}

# Trouve la première ligne plus récente que celle stocké dans la sauvegarde
for line in $(grep -oP '^: \d{10}:\d+;' ${history_file} |grep -oP '\d{10}'); do
    if ((line > last_timestamp)); then
        first_timestamp="${line}"
        break
    fi
done

if [[ -n "${first_timestamp}" ]]; then
    sed -n "/${first_timestamp}/,\$p"  "${history_file}" >> $backup_file
fi
