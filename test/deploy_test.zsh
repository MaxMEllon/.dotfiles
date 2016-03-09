: before
{
  local expect
}

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

  it 'vimrc into home directory'
    [ -f ~/.vimrc ]
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

  it 'has emojify command'
    which emojify &> /dev/null
    expect=$?
    assert.equals $expect 0
  end
end

: after
{
  unset expect
}
