#!/bin/zsh

if [[ ! -n $TMUX ]]; then
	autoload colors && colors
	tmux start-server

	case $HOST in
		"burp"|"xr591")
			if [[ -t 0 && $(tty) =~ /dev/tty ]]\
			   && ! pgrep -u $USER startx &> /dev/null; then
				startx
			fi
			;;

		"alarmpi")
			col1=${fg[yellow]}
			col2=${fg[green]}
			col3=${fg[red]}

			# Uptime
			upSeconds=$(cut -d '.' -f1 /proc/uptime)
			secs=$((${upSeconds} % 60))
			mins=$((${upSeconds} / 60 % 60))
			hours=$((${upSeconds} / 3600 % 24))
			days=$((${upSeconds} / 86400))
			uptime=$(printf "%d days, %02dh %02dmn %02dsec"\
					 $days $hours $mins $secs)
			uptime=$(printf "%b%-19b: %b"\
				     "${col1}"\
			         "Uptime"\
				     "${col2}${uptime}${col3}")

			# Mémoire
			avail=$(($(grep MemAvailable /proc/meminfo | awk {'print $2'})\
					 / 1000))
			total=$(($(grep MemTotal /proc/meminfo | awk {'print $2'})\
					 / 1000))
			mem=$(printf "%'d MB Available / %'d MB Total" ${avail} ${total})
			mem=$(printf "%b%-19b: %b"\
				  "${col1}"\
			      "Memory"\
				  "${col2}${mem}${col3}")

			# Charge du système
			read one five fifteen rest < /proc/loadavg
			load_average="${one}, ${five}, ${fifteen} (1, 5, 15 min)"
			load_average=$(printf "%b%-19b: %b"\
						   "${col1}"\
					 	   "Load Averages"\
						   "${col2}${load_average}${col3}")

			processes=$(ps ax | wc -l | tr -d " ")
			processes=$(printf "%b%-19b: %b"\
					    "${col1}"\
					    "Running Processes"\
					    "${col2}${processes}${col3}")


			# Mise en forme
			logo=("${fg[green]}"
                  "   .~~.   .~~.    $(date +'%A, %e %B %Y, %r')"
                  "  '. \ ' ' / .'   $(uname -srmo)${fg[red]}"
                  "   .~ .~~~..~.    "
                  "  : .~.'~'.~. :   ${uptime}"
                  " ~ (   ) (   ) ~  ${mem}"
                  "( : '~'.~.'~' : ) ${load_average}"
                  " ~ .~ (   ) ~. ~  ${processes}"
                  "  (  : '~' :  )   "
                  "   '~ .~~~. ~'    "
                  "       '~'        "
                  "${reset_color}    ")

			echo ${(F)logo}

			tmux new-session -AD -s admin
			;;
		*)
			;;
	esac
fi
# vim: foldmethod=indent
