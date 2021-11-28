#!/bin/bash - 
#===============================================================================
#
#          FILE: switch_desktop.sh
# 
#         USAGE: ./switch_desktop.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS: ---
#  REQUIREMENTS: Gnome Desktop Environment
#          BUGS: --- 
#         NOTES: ---
#        AUTHOR: code 
#  ORGANIZATION: 
#       CREATED: 2021年03月24日 16:15
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an er

PID=$(pgrep -f gnome-session | head -n 1)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

PIC_DIR='/data/pictures/Wallpapers'    
PIC=$(ls $PIC_DIR/* | shuf -n1)
gsettings set org.gnome.desktop.background picture-uri "file://$PIC"
