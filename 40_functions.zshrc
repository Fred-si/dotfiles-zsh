#!/bin/zsh

func_dir="${ZDOTDIR}/functions"
fpath=($func_dir $fpath)

for file in ${func_dir}/*; do
	[[ -d $file ]] && continue

	func=${file##*/}

	if functions $func >/dev/null; then
		unfunction $func
	fi

	# L’option -U permet de supprimer l’expansion des alias dans les
	# fonctions
	autoload -U $func
done

local_func_dir="${func_dir}/local"
if [[ -d "${local_func_dir}" ]]; then
	fpath=($local_func_dir $fpath)

	for file in ${local_func_dir}/*; do
		[[ -d $file ]] && continue

		func=${file##*/}

		if functions $func >/dev/null; then
			unfunction $func
		fi

		# L’option -U permet de supprimer l’expansion des alias dans les
		# fonctions
		autoload -U $func
	done
fi
# vim: foldmethod=syntax noexpandtab
