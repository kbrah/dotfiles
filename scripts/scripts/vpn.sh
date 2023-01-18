#!/bin/bash


(echo "158783@tays.ext.fi"; echo "a") | nmcli connection up Fimlab --ask

sudo killall ssh
sudo sh /home/lasse/scripts/tunnels.sh
