#!/bin/bash
#This bash program connects to mochad then scans for alert/normal events from 
#a specific DS10A. The lamp or appliance module M1 is turned on
#for alerts and off for normal. Assuming flite is installed, voice prompts
#should also be heard.
#Sample event generated by mochad for a DS10A
#12/20 11:53:58 Rx RFSEC Addr: EF:43:80 Func: Contact_alert_min_low_DS10A

# Connect TCP socket to 192.168.1.254 port 1099 on handle 6.
exec 6<>/dev/tcp/192.168.1.254/1099

# RF devices send the same event multiple times so to avoid multiple
# PL commands and voice prompts, keep track of the device state.
ds10state="unknown"

while read <&6
do
    # Show the line on standard output just for debugging.
    echo $REPLY >&1
    case $REPLY in
        *Rx\ RFSEC\ Addr:\ EF:43:80*alert*)
        if [ "$ds10state" != "alert" ]
        then
                echo "pl m1 on" >&6
                flite -t "Door open"
                ds10state="alert"
        fi
        ;;
        *Rx\ RFSEC\ Addr:\ EF:43:80*normal*)
            if [ "$ds10state" != "normal" ]
            then
                echo "pl m1 off" >&6
                flite -t "Door closed"
                ds10state="normal"
            fi
        ;;
    esac
done

