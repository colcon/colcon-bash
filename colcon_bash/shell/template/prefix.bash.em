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
    echo "not found: \"$_colcon_prefix_source_bash_script\"" 1>&2
  fi

  unset _colcon_prefix_source_bash_script
}

# a bash script is able to determine its own path
_prefix_COLCON_CURRENT_PREFIX=$(builtin cd "`dirname "${BASH_SOURCE[0]}"`" > /dev/null && pwd)

@[  for pkg_name in pkg_names]@
COLCON_CURRENT_PREFIX=$_prefix_COLCON_CURRENT_PREFIX@('' if merge_install else ('/' + pkg_name))
colcon_prefix_source_bash_script "$COLCON_CURRENT_PREFIX/share/@(pkg_name)/package.bash"

@[  end for]@
unset COLCON_CURRENT_PREFIX
unset _prefix_COLCON_CURRENT_PREFIX
unset colcon_prefix_source_bash_script
@[end if]@
