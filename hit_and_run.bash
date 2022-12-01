# !/ bin / bash

check="$(sudo pacman -Qs "$1" | grep "local" | grep "${1} ")";
# check="$(ls /bin | grep ${1})";
if [ -z "${check}" ];
then
  echo " Installning $1 "
  pacman -Syu
  pacman -S $1
fi

echo " $1 installed "
echo " Running $2 processes of $1 for $3 seconds in xterm "

for ((i = 0 ; i < $2 ; i++));
do
  xterm -hold -e bash -c $1 &
done

sleep $3

# d ö da alla xterm - processer
pkill -f xterm

echo -n " Uninstall $1 ? ( y / n ) "
read val

if [[ " $val " == " y " ]]
then
  echo " Uninstallning $1 "
  pacman -R $1
fi
