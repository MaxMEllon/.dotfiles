__devcon::has_command()
{
  type $1 &>/dev/null
  (( $? == 0 )) && true || false
}

__devcon::when_has_not_command()
{
  cat <<-WARN
Required install "devcontainer" command
  $ npm install -g @devcontainers/cli
WARN
}

__devcon::kill()
{
  docker kill $(docker ps | grep devcontainer | awk '{print $1}')
}

__devcon::prune()
{
  docker rm $(docker ps -a | grep devcontainer | awk '{print $1}')
}

__devcon::stop()
{
  docker stop $(docker ps | grep devcontainer | awk '{print $1}')
}

__devcon::help()
{
    cat <<-HELP
About:
  A command is wrapping native docker command and devcontainer-cli.

  $ devcon <sub> [args..]

Command:
  up                   Create and run dev container
  build [path]         Build a dev container image
  run-user-commands    Run user commands
  read-configuration   Read configuration
  features             Features commands
  templates            Templates commands
  exec <cmd> [args..]  Execute a command on a running dev container

  all-reload           Kill process and rebuild all dev container (update environment variable and start)
  prune                Remove dev container all images
  rebuild              rebuild all dev container (NOT update environment variable and kill process but DONT start)
  stop                 Kill process of dev container
  help                 Show help

Example:
  $ devcon exec env    # show environment in container
  $ devcon all-reload

Option:
  --help               Show help
  --version            Show version
HELP
}

devcon()
{
  if ! __devcon::has_command devcontainer; then
    __devcon::when_has_not_command
    return 1
  fi

  case "$1" in
    all-reload)
      if $2
      __devcon::kill
      __devcon::prune
      __devcon::stop
      devcontainer build --workspace-folder .
      devcontainer up --workspace-folder .
      ;;

    prune)
      __devcon::prune
      ;;

    rebuild)
      __devcon::kill
      devcontainer build --workspace-folder .
      ;;

    stop)
      __devcon:stop
      ;;

    help)
      __devcon::help
      ;;

    *)
      devcontainer ${1} --workspace-folder . ${@:2}
      ;;
  esac
}
