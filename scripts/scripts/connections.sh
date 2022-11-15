#!/bin/bash

choises="VPN+Tunnels\nVPN\nTunnels\nRestart"

chosen=$(echo -e "$choises" | dmenu -i)

case "$chosen" in
    VPN+Tunnels) sudo -A sh /home/lasse/scripts/vpn.sh ;;
    Tunnels) sudo -A sh /home/lasse/scripts/tunnels.sh ;;
    VPN) sudo -A sh /home/lasse/scripts/vpn.sh ;;
    Restart)
        sudo -A killall ssh
        sudo -A sh /home/lasse/scripts/tunnels.sh ;;
esac
