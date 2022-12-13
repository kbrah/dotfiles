#!/bin/bash

choises="VPN+Tunnels\nVPN\nTunnels\nRestart"

chosen=$(echo -e "$choises" | dmenu -i)

case "$chosen" in
    VPN+Tunnels) gksudo -A sh /home/lasse/scripts/vpn.sh ;;
    Tunnels) gksudo -A sh /home/lasse/scripts/tunnels.sh ;;
    VPN) gksudo -A sh /home/lasse/scripts/vpn.sh ;;
    Restart)
        gksudo -A killall ssh
        gksudo -A sh /home/lasse/scripts/tunnels.sh ;;
esac
