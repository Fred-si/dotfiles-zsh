#!/bin/zsh

if [[ -e /usr/bin/pacman ]]; then
	alias pac='pacman'
    alias pkgfile='pac -F'

	autoload upgrade
	autoload pacsearch
	autoload pacinfo

	# Installation/suppression de paquet
	alias ins='sudo pacman -S'
	alias uins='sudo pacman -Rsu'

	# Mise à jour et recherche de paquets
	alias upd='sudo pacman -Sy && pacman -Qu'

    if where yay >/dev/null; then
        alias yay='yay --answerclean All --answerdiff None --answeredit None --cleanafter --removemake --sudoloop'
    fi

elif [[ -e /usr/bin/apt ]]; then
	# Installation/suppression de paquet
	alias ins='sudo apt install'
	alias uins='sudo apt-get autoremove --purge'

	# Mise à jour et recherche de paquets
	alias upd='sudo apt update'
	alias upgrade='sudo apt upgrade'

elif [[ -e /usr/bin/apt-get ]]; then
	alias ins='sudo apt-get install'
	alias uins='sudo apt-get autoremove --purge'

	alias upd='sudo apt-get update'
	alias upgrade='sudo apt-get upgrade'
fi

alias up='upgrade'

