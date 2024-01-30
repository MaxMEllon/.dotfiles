# colors()
# {
#   for c in {000..255}; do
#     echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo
#   done
#   echo
#   for c in {000..255}; do
#     echo -n "\e[38;5;${c}m▇"
#   done
#   echo
#   for c in {000..255}; do
#     echo -n "\e[30;48;5;${c}_"
#   done
#   echo
# }
