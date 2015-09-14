#!/bin/bash

#deadspider. born 03 June 2015.
#will execute your orders and obey your commands...

# ----- spider commands ----- #
# k - kills
# s - search
# d - dies
# h - helps
# ...

# ----- spider internal rules ----- #
#_f means function
# with 20 XP it goes to the next level


# ----- spider internals ----- #
# xp # 
LEVEL=1
XP=18
# colors #
red='\033[0;31m'
white='\033[1;37m'
yellow='\033[1;33m'
NC='\033[0m' # No Color

# variables
SLEEP_INTERVAL=3
KILL=1
VICTIM=""

find_victim_f()
{
	ps -A | grep $VICTIM
	if [ $? -eq 0 ]; then
		echo "victim found!"
		if [ $KILL -eq 1 ]; then
			killall -9 $VICTIM
			echo "killed!"
		fi
	else
		echo "no victim!"
	fi
}

kill_f()
{
	read THE_VICTIM
	killall -9 $THE_VICTIM &> /dev/null
	if [ $? -eq 0 ]; then
		echo -e "${red}[killed!]${NC}"
	else
		echo -e "${red}[no victim master!]${NC}"
	fi
}

search_f()
{
	read THE_VICTIM
	ps -A | grep --color $THE_VICTIM
	if [ $? -eq 0 ]; then
		echo -e "${red}[victim found!]${NC}"
	else
		echo -e "${red}[no victim master!]${NC}"
	fi
}

die_f()
{
	echo "#----------#"
	exit 0
}

amount_f()
{
	di
}

info_f()
{
	uname -a
	lsb_release -a
}

mem_f()
{
	free -m
}

clearcaches_f()
{
	sync
	sudo sh -c 'echo 3 >/proc/sys/vm/drop_caches'
}

ping_f()
{
	ping -c 2 ya.ru
}

update_f()
{
	sudo apt-get update
	sudo apt-get upgrade
}

reboot_f()
{
	sudo reboot
}

help_f()
{
	echo "k - kill"
	echo "s - search"
	echo "d - die"
	echo "a - amount hdd"
	echo "i - osinfo"
	echo "m - meminfo"
	echo "c - clear caches"
	echo "p - ping"
	echo "u - update"
	echo "r - reboot"

	echo "h - help"
}


#----- main -----#
echo -en "[...awaken. ${yellow}LVL:$LEVEL, XP:$XP${NC}] "

while true
do
	echo -e "${white}[Master tell me what should I do]${NC}"
	#echo "[Master tell me what should I do]"
	read IN

	#----- switch -----#
	case $IN in
		k) echo -e "${white}[Which one do you want me to kill master?]${NC}"
		kill_f
		;;
		s) echo -e "${white}[Which one do you want me to find master?]${NC}"
		search_f
		;;
		d) echo -e "${white}[I'm already dead but I'll die for you master!]${NC}"
		die_f
		;;
		a) echo -e "${white}[Amount is next master:]${NC}"
		amount_f
		;;
		i) echo -e "${white}[Nest info is here master:]${NC}"
		info_f
		;;
		m) echo -e "${white}[Mem info is here master:]${NC}"
		mem_f
		;;
		c) echo -e "${white}[Clearing caches master]${NC}"
		clearcaches_f
		;;
		p) echo -e "${white}[Will ping the internet, master]${NC}"
		ping_f
		;;
		u) echo -e "${white}[Update the system]${NC}"
		update_f
		;;
		r) echo -e "${white}[Starting reincarnation..., master]${NC}"
		reboot_f
		;;
		h) echo -e "${white}[Here is the help, master]${NC}"
		help_f
		;;
		*) echo -e "${white}[I don't know what is it, master]${NC}"
		
	esac

	echo "#----------#"
	#sleep $SLEEP_INTERVAL
	#find_victim_f
done
