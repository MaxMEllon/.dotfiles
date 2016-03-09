: before
{
  if [ -z ${DOTPATH+x} ]; then
    export DOTPATH="$HOME/.dotfiles"
  fi
  source $DOTPATH/lib/conveni.sh
  local expect
}

describe 'lib modules test'
  it 'has'
    has 'git'
    expect=$?
    assert.equals $expect 0
  end

  it 'has not'
    has 'hogepoge'
    expect=$?
    assert.equals $expect 1
  end
end

describe 'deployed dotfiles'
  it 'bashrc into home directory'
    [ -f ~/.bashrc ]
    expect=$?
    assert.equals $expect 0
  end

  it 'zshrc into home directory'
    [ -f ~/.zshrc ]
    expect=$?
    assert.equals $expect 0
  end

  it 'vim directory into home directory'
    [ -d ~/.vim ]
    expect=$?
    assert.equals $expect 0
  end

  it 'gitconfig into home directory'
    [ -f ~/.gitconfig ]
    expect=$?
    assert.equals $expect 0
  end
end

: after
{
  unset expect
}
