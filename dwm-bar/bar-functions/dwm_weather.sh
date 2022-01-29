#!/bin/sh

# A dwm_bar function to print the weather from wttr.in
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: curl

# Change the value of LOCATION to match your city
dwm_weather() {
    NAME=$1
    LOCATION=$2
    if [ "$IDENTIFIER" = "unicode" ]; then
       printf "%s %s" $NAME "$(curl https://wttr.in/$LOCATION\?format\=2 | sed -r 's/️//g' | sed -r 's/🌡//g' | sed -r 's/🌬//g' | sed -r 's/  //g' )"
    else
        printf "WEA %s" "$(curl -s wttr.in/$LOCATION?format=1 | grep -o "[0-9].*")"
    fi
    printf "%s\n"
}

dwm_weather
