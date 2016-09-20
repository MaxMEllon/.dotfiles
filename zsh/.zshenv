# zmodload zsh/zprof && zprof

if ! [ -z $DOTENV_LOADED ]; then
  # print 'skip load\n'
else
  source ~/.dotfiles/lib/conveni.sh
  export PATH=${HOME}/local/bin:${PATH}
  export PATH=/usr/local/bin:${PATH}
  export PATH=${HOME}/local/go/bin:${PATH}
  export PATH=~/.zplug/bin:${PATH}
  export npm_dir=${NVM_PATH}_modules
  source ~/.dotfiles/bash/env.bash
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  if [ is_mac ]; then
    [ -s ${HOME}/.exenv/bin/exenv ] && export PATH=${HOME}/.exenv/bin:${PATH}
    [ -s ${HOME}/.erlenv/bin/erlenv ] && export PATH=${HOME}/.erlenv/bin:${PATH}
    [ -s ${HOME}/.rbenv/bin/rbenv ] && export PATH=${HOME}/.rbenv/bin:${PATH}
    [ -s ${HOME}/.nvm/nvm.sh ] && . ${HOME}/.nvm/nvm.sh
    has rbenv && eval "$(rbenv init - --no-rehash)"
    has exenv && eval "$(rbenv init - --no-rehash)"
    has erlenv && eval "$(rbenv init - --no-rehash)"
  fi
  export DOTENV_LOADED=1
fi

