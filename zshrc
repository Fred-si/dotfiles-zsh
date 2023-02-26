#!/bin/zsh

if [[ $HOST != 'frederic' ]]; then
    umask 037
fi
which sudo 2>&1 >/dev/null || sudo(){$@}

fpath=($fpath ${ZDOTDIR})

# Charge les fichiers du dossier .zsh
for file in ${ZDOTDIR}/*.zshrc(on); do
    source ${file}
done

local dircolors_config_file="${ZDOTDIR}/dircolors" \
    && [[ -e ${dircolors_config_file} ]] \
    && eval $(dircolors ${dircolors_config_file})

# Options
HISTFILE=~/.zsh_history
HISTSIZE=600		# Nombre maximum de commandes stocker dans l'historique interne d'un shell
SAVEHIST=5000		# Nombre maximum de commandes stocker dans $HISTFILE
setopt appendhistory		# Ajoute les nouvelles commandes à l'historique au lieu de le remplacer
setopt extendedhistory		# Affiche le timstamp et la durée de la commande en début de ligne
setopt sharehistory         # Ajoute les commandes à l'historique dès qu'elles sont exécutées
setopt histignorealldups	# Supprime les doublons plus ancien dans l'historique
setopt histignorespace		# ne pas ajouter les commandes précédé par un espace à l'historique

setopt extendedglob correctall notify
unsetopt beep

# Prompt
Prompt="forkclint"

fpath=($fpath ${ZDOTDIR})
autoload -U promptinit
promptinit
setopt promptsubst
prompt $Prompt

# ZSH_HIGHLIGHT
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[globbing]='bg=blue'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue,bg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=magenta,bold'

# Key binding
bindkey -e	# Utilise les raccourcis claviers de Emacs
bindkey "^[[3~" delete-char
autoload edit-command-line && zle -N edit-command-line
bindkey "^G" edit-command-line
bindkey "^T" accept-line

# Désactive l'intéruption du flux de donné du terminal (CTRL-S)
stty -ixon
