#!/bin/bash
#Configuration
######
config_file=config.sh
__editor=vim
######
#Initialization
####################################
__t_dir=$(cd "$( dirname "${BASH_SOURCE}[0]" )" && pwd)
__dotfiles_dir=dotfiles

__get_file_by_hostname_from() {
  local dir=$1
  file=$(hostname).sh
  echo $__t_dir/$dir/$file
}

__source_silently() {
  [[ -s $1 ]] && source $1
}

__source_silently $( __get_file_by_hostname_from aliases )
__source_silently $__t_dir/aliases.sh
alias gl_a="\$__editor $__t_dir/aliases.sh"
alias l_a="\$__editor $(__get_file_by_hostname_from aliases)"

__source_silently $__t_dir/$config_file

export_dotfiles() {
  for df in ${__dotfiles[@]}; do
    local t=$__t_dir/$__dotfiles_dir/$(basename $df)
    [[ -f $df ]] && cp $df $t
  done
}

import_dotfiles() {
  for df in ${__dotfiles[@]}; do
    local t=$__t_dir/$__dotfiles_dir/$(basename $df)
    [[ -f $t ]] && cp $t $df
  done
}

push_tower() {
  local cur_dir=pwd
  cd $__t_dir 
  export_dotfiles
  git add -e
  git add dotfiles
  git commit
  git push
  cd $cur_dir
}
