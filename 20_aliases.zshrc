#!/bin/zsh

# Navigation
	alias ls='ls --color=auto --group-directories-first'
	alias l='ls'
	alias la='ls -A'
	alias ll='ls -lh --time-style="+%d-%m-%y %H:%M"'
	alias lll='ls -lh --color=always | less -R'
	alias lla='ls -alh'

	alias ..='cd ..'
	alias cd..='cd ..'
	alias ,,='cd ..'
	alias é='cd ~'

# Fichiers et dossiers
	alias cp='rsync -aPh'
	alias mkdir='mkdir -m 770'
	alias -g ZERO='shred -zu -n 0'
	alias vim='nvim'
	alias view='nvim -R'
    alias vifm='vifm .'

	alias renomme_photo='jhead -n${PWD:t}-%Y%m%d_%H%M%S (#i)*.jpe#g(.)'

# Grep
	alias grep='grep --color=auto'

# Divers
	alias bp='bpython'
	alias ping='ping -c 10'
	alias mdp='pwgen -sy 15 1 | xclip -selection c'

# Zsh
	alias so='source ~/.zshrc'

# Administration
	alias -g S='sudo'
	alias -g systl='systemctl'
	
	alias du='du -h'
	alias dus='du -sh'
	alias df='pydf'

	alias top='htop -d 50'

	alias free='free -h'
	alias mem='sudo ps_mem'


	alias udb='sudo updatedb'
	alias sb='sudo backup'

	if [[ -e /usr/bin/systemctl ]];then
		alias reboot='systemctl reboot'
		alias dodo='systemctl poweroff'
		alias sus='systemctl suspend -i'
	else
		alias reboot='sudo shutdown -r now'
		alias dodo='sudo shutdown -h now'
	fi

# Android ADB
	# ADB
		alias a='adb'
		alias ast='adb start-server'
		alias adev='adb devices'

	# Reboot
		alias arb='adb reboot'
		alias arbb='adb reboot bootloader'
		alias arbr='adb reboot recovery'

# Globaux
	# Grep
		alias -g G='|grep'
		alias -g GI='|grep -i'
	
	# Sort
		alias -g SO='|sort'
		alias -g SN='|sort -n'
		alias -g SU='|sort -u'
	
	# Affichage
		alias -g C='|cut'
		alias -g L='|less'
		alias -g H='|head'
		alias -g T='|tail'

	alias -g W='|wc -l'
	alias -g X='|xargs'

	# Redirection
		# No Standart
			alias -g NS='> /dev/null'
		# No Error
			alias -g NE='2> /dev/null'
		# No Message
			alias -g NM='> /dev/null 2>&1'

# Paste
	alias -g IX="|& curl -s -F 'f:1=<-' ix.io"
	alias -g PT='| curl -F c=@- https://ptpb.pw/'

if [[ $(hostname) = 'lysa' ]];then
	alias hdmi_enable='xrandr --output HDMI1 --mode 1920x1080'
	alias hdmi_disable='xrandr --output HDMI1 --off'

	alias wr='sudo rmmod brcmfmac && sudo modprobe brcmfmac && sleep 3 && sudo netctl start tintin'

fi

alias sc='smsclip'
alias -g XO='$(xclip -selection c -o)'
alias -g XI='| xclip -selection c'

# Youtube
alias youtube-dl="yt-dlp"

alias youtube-video="youtube-dl --merge-output-format mkv --audio-format mp3"
alias ytv="youtube-video"

alias youtube-audio="youtube-dl -x --audio-quality 0 --audio-format mp3"
alias yta="youtube-audio"

alias myt='mpv --ytdl'
alias myta='mpv --ytdl --no-video'
alias myc='mpv --ytdl XO'
