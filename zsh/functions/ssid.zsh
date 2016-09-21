ssid()
{
  if is_osx; then
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | grep " SSID" | awk '{$1="";print}' | sed "s/ //"
  else
    printf '✗'
  fi
}
