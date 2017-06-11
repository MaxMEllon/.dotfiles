auto-format()
{
  vim $@ +"argdo exec ':norm gg=G' | exec 'call maxmellon#remove_whitespace()'" +q!
}
