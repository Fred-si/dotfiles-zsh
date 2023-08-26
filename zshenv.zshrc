#!/bin/zsh
export ZDOTDIR="${$(readlink -f ${HOME}/.zshenv):h}"

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"

export HISTFILE="${XDG_DATA_HOME}/zsh/history"

export LC_COLLATE="fr_FR.utf8"
[[ -f /etc/os-release ]] \
    && export OS_RELEASE="$(grep -P '^NAME=' /etc/os-release |cut -d '"' -f 2)"

if [[ -f "$HOME/.cargo/env" ]];then
    source "$HOME/.cargo/env"
fi

for p in "${HOME}/.local/bin"; do
	[[ ! "${PATH}" =~ "$p" ]] \
        && [[ -d "$p" ]] \
		&& export PATH="${PATH}:${p:A}"
done
unset p

