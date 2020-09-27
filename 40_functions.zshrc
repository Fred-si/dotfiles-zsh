#!/bin/zsh

fpath=(${ZDOTDIR}/functions $fpath)
FUNCTIONS=(
			compte_fichiers
			bac_a_sable
			renomme_fichiers

			bak

			hgrep

			pacsearch
			upgrade

			couleurs_terminal
			bind

			get_date
			smsclip
			equalizer
		  )

# Gestion du réseaux
if [[ ! $(hostname) == "raspberrypi" ]]; then
FUNCTIONS=( $FUNCTIONS
			pi
		  )
fi

for func in $FUNCTIONS; do
	if functions $func >/dev/null; then
		unfunction $func
	fi
	# L’option -U permet de supprimer l’expansion des alias dans les
	# fonctions
	autoload -U $func
done

# vim: foldmethod=syntax
