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

__get_hostnames_dirs_from_config() {
  local config_file=$1
  local root_dir=$2
  local hostnames_dir=hostnames
  local t=$root_dir/$hostnames_dir
  #If config-file
  if [[ -f $config_file ]]; then 
    #Sourcing from it
    .  $config_file; 
    #And if hostnames
    if [ ${hostnames} ]; then
      #Foreach it
      for hn in ${hostnames[@]}; do
        #If hostname dir exists
        if [[ -d $t/$hn ]]; then
          #Sourcing all scripts from it
          for script in $(\ls $t/$hn); do
            . $t/$hn/$script
          done
        fi
      done
    fi
  fi
}

__get_hostnames_dirs_from_config $config_file $(__tower_root_dir)
