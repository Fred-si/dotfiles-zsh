#!/bin/zsh

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '%F{'magenta'}(%f%s%F{'magenta'})%f-%F{'magenta'}[%f%F{'green'}%b%f%F{'magenta'}]%f' "zsh: %r"
zstyle ':vcs_info:*' actionformats "%F{'magenta'}(%f%s%%F{'magenta'})%f-%F{'magenta'}[%F{'green'}%b%F{'cyan'}|%F{'green'}%a]%F{'magenta'} " "zsh: %r"

