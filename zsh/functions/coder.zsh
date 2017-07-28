__coder::help()
{
  cat <<-HELP
	Usage:
	  coder [SUB_COMMAND] [EXT] [FILE_NAME]

	Author:		maxmellon
HELP
  return 1
}

coder()
{
  case $# in
    0 )
      __coder::help || return 1
      ;;
    * )
      case $1 in
        'init' )
          if (( $# == 2 )); then
            wget https://raw.githubusercontent.com/MaxMEllon/at/master/_at &
            wget https://raw.githubusercontent.com/MaxMEllon/at/master/_run &
            wget https://raw.githubusercontent.com/MaxMEllon/at/master/_dbg &
            wget https://raw.githubusercontent.com/MaxMEllon/sandbox/master/_templates/$2/file.$2 -O a.$2 &
            wget https://raw.githubusercontent.com/MaxMEllon/sandbox/master/_templates/$2/file.$2 -O b.$2 &
            wget https://raw.githubusercontent.com/MaxMEllon/sandbox/master/_templates/$2/file.$2 -O c.$2 &
            wget https://raw.githubusercontent.com/MaxMEllon/sandbox/master/_templates/$2/file.$2 -O d.$2 &
            wait
            chmod +x _at _run _dbg
          else
            __coder::help
          fi
          ;;
        'get' )
          if (( $# == 3 )); then
            wget https://raw.githubusercontent.com/MaxMEllon/sandbox/master/_templates/$2/file.$2 -O $3.$2
          else
            __coder::help
          fi
          ;;
      esac
      ;;
  esac
}
