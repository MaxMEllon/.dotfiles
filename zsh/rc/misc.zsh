remove_duplicated_path()
{
  _path=""
  for _p in $(echo $PATH | tr ':' ' '); do
    case ":${_path}:" in
      *:"${_p}":* )
        ;;
      * )
        if [ "$_path" ]; then
          _path="$_path:$_p"
        else
          _path=$_p
        fi
        ;;
    esac
  done
  export PATH=$_path
}

remove_duplicated_path

myplug zsh/completes/rake_completion
myplug zsh/completes/npm_completion

ulimit -m 8000
ulimit -v 786432
ulimit -n 2048
