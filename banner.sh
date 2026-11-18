#!/bin/bash
echo
/usr/bin/figlet -f big "@likscam The Dev" | /usr/games/lolcat -f
echo -e "\n  Cloud Shell · Railway Ubuntu\n"
echo "  User    : $(whoami) @ $(hostname)"
echo "  OS      : $(. /etc/os-release; echo $PRETTY_NAME)"
echo "  Kernel  : $(uname -r)"
echo "  Uptime  : $(uptime -p)"
echo "  CPU     : $(nproc) core"
echo "  Memory  : $(free -h | awk '/Mem:/{print $3" / "$2}')"
echo "  Disk    : $(df -h / | awk 'NR==2{print $3" / "$2" ("$5")"}')"
echo "  IP      : $(hostname -I | awk '{print $1}')"
echo
echo "  Ketik: vps  (lihat info ini lagi)"
echo