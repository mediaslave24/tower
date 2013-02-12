#!/bin/bash

#Configuration
######
config_file=config.sh
######

#Initialization
####################################

__get_file_by_hostname_from() {
  local dir=$1
  local root=$(cd "$( dirname "${BASH_SOURCE}[0]" )" && pwd)
  file=$(hostname).sh
  echo $root/$dir/$file
}

__source_silently() {
  [[ -s $1 ]] && source $1
}

__source_silently $( __get_file_by_hostname_from aliases )
__source_silently aliases.sh

alias gl_a='\vim aliases.sh'
alias l_a="\vim $(__get_file_by_hostname_from aliases)"
