#!/bin/bash

#Configuration
######
config_file=config.sh
######

#Initialization
####################################
# Getting directory with this script
# __tower_root_dir() {
#   (cd "$( dirname "${BASH_SOURCE}[0]" )" && pwd)
# }
# __root_dir=
# __get_aliases_from () {
#   local alias_dir=aliases
#   local root=$1
#   local cur_hostname=$(hostname).sh
#   
#   local t=$root/$alias_dir/$cur_hostname
#   [[ -s $t ]] && source $t
# }
# 
# __get_aliases_from $(__tower_root_dir)
# 
# source aliases.sh

__get_file_by_hostname_from() {
  local dir=$1
  local root=$(cd "$( dirname "${BASH_SOURCE}[0]" )" && pwd)
  file=$(hostname).sh
  "$root/$dir/$file"
}

__source_silently() {
  [[ -s $1 ]] && source $1
}

__source_silently $( __get_file_by_hostname_from aliases )
