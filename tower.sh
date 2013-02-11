#!/bin/bash

#Configuration
######
config_file=config.sh
######

#Initialization
####################################
# Getting directory with this script
__tower_root_dir() {
  (cd "$( dirname "${BASH_SOURCE}[0]" )" && pwd)
}

__get_aliases_from () {
  local alias_dir=aliases
  local root=$1
  local cur_hostname=$(hostname).sh
  
  local t=$root/$alias_dir/$cur_hostname
  [[ -s $t ]] && source $t
}

__get_aliases_from $(__tower_root_dir)
