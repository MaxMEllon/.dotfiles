if has auto-fu-init; then
  afu+cancel()
  {
    afu-clearing-maybe
    ((afu_in_p == 1)) && { afu_in_p=0; BUFFER="$buffer_cur"; }
  }
fi

