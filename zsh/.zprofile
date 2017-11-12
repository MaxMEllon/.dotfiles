for i in /etc/profile.d/*.sh ; do
  [ -r $i ] && source $i
done

export PATH="$HOME/.cargo/bin:$PATH"
