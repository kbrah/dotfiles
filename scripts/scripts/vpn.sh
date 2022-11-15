#!/bin/bash


(echo "158783@tays.ext.fi"; echo "a") | nmcli connection up Fimlab --ask

sudo sh /home/lasse/tunnels
