ls_abbrev()
{
  local cmd_ls='ls'
  local -a opt_ls
  opt_ls=('-CF' '--color=always')
  case "${OSTYPE}" in
    freebsd*|darwin*)
      if type gls > /dev/null 2>&1; then
        cmd_ls='gls'
      else
        opt_ls=('-CFG')
      fi
      ;;
  esac

  local ls_result
  ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

  local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

  if [ $ls_lines -gt  6 ]; then
    echo "$ls_result" | head -n 3
    echo '...'
    echo "$ls_result" | tail -n 3
    echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
  else
    echo "$ls_result"
  fi
}

chpwd() { ls_abbrev }
