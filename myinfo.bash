#!/bin/bash

version=$(cat /proc/sys/kernel/osrelease)

ip=$(ip -4 a | grep inet | grep \lo\b | grep -o -E 'inet(.*)(brd)' | grep -o -E '([0-9]{1,3}\.){3}[0-9]{1,3}')

mac=$(cat /sys/class/net/*/address | head -n 1)


for path in "$@"
do
	case $path in
		-a|--all)
			echo "Release version: $version"
			echo "IP address: $ip"
			echo "MAC address: $mac"
			;;
		-v|--version)
			echo "Release version: $version"
			;;
		-i|--ip)
			echo "IP address: $ip"
			;;
		-m|--mac)
			echo "MAC address: $mac"
			;;
		--help)
			echo "Usage: myinfo.bash OPTION(S)"
			echo "Prints out information about system"
			echo
			echo "OPTIONS"
			echo "-a, --all        display all information"
			echo "-v, --version    display release version"
			echo "-i, --ip         display IP address"
			echo "-m, --mac        display MAC address"
			echo "    --help       display this message"
			;;
	esac
done
