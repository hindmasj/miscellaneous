#!/bin/bash
 
IFACE="wlp2s0"
 
if [ "$1" = "$IFACE" ] && [ "$2" = "up" ]; then
    # Figure out the wifi SSID
    SSID=$(/sbin/iwconfig ${IFACE} | \
		  awk 'BEGIN {RS=" ";FS=":"}/ESSID/{gsub("\"","",$2);print $2}')
    
    case "$SSID" in
        "BTOpenzone")
	    URL=" https://www.btopenzone.com:8443/ante"
            DATA='username=CHANGEME&password=CHANGEMETOO'
 
           curl -d "$DATA" -H "$URL" > /tmp/${SSID}.last 2>>&1
        ;;
    esac
fi

