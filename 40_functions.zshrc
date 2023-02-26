#!/bin/zsh

for dir in "${ZDOTDIR}/functions" "${ZDOTDIR}/functions/local"; do
	[[ -d "${dir}" ]] \
		|| continue


	fpath=($fpath $dir)

	for file in ${dir}/*(N); do
		[[ -f $file ]] \
			|| continue

		func=${file:t}

		functions $func > /dev/null \
			&& unfunction $func

		# L’option -U permet de supprimer l’expansion des alias dans les
		# fonctions
		autoload -U $func
	done
done

