# generated from colcon_bash/shell/template/prefix.bash.em
@[if pkg_names]@

# function to source another script with conditional trace output
# first argument: the name of the script file
colcon_prefix_source_bash_script() {
  # arguments
  _colcon_prefix_source_bash_script="$1"

  # source script with conditional trace output
  if [ -f "$_colcon_prefix_source_bash_script" ]; then
    if [ -n "$COLCON_TRACE" ]; then
      echo ". \"$_colcon_prefix_source_bash_script\""
    fi
    . "$_colcon_prefix_source_bash_script"
  else
    if [ -n "$COLCON_TRACE" ]; then
      echo "not found: \"$_colcon_prefix_source_bash_script\""
    fi
  fi

  unset _colcon_prefix_source_bash_script
}


@[end if]@
@[for i, pkg_name in enumerate(pkg_names)]@
@[  if i == 0]@
# a bash script is able to determine its own path
@[  end if]@
COLCON_CURRENT_PREFIX=$(builtin cd "`dirname "${BASH_SOURCE[0]}"`@('' if merge_install else ('/' + pkg_name))" > /dev/null && pwd)
colcon_prefix_source_bash_script "$COLCON_CURRENT_PREFIX/share/@(pkg_name)/package.bash"

@[end for]@
@[if pkg_names]@
unset COLCON_CURRENT_PREFIX
unset colcon_prefix_source_bash_script
@[end if]@
