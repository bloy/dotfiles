#!/bin/bash
#xplanet-gnome.sh shell script v0.2
#shows Earth on your Gnome desktop with current lighting conditions,i.e. day and night

DELAY=15m

PREFIX=~/etc/
OUTPUT=xplanet.png
APPEND=2

GEOMETRY=2560x768
LONGITUDE=15
LATITUDE=30
#default is no projection,i.e. render a globe
#rectangular is the flat world map. also try ancient, azimuthal,  mercator,..
PROJECTION=mercator  

#rename background image so Gnome realises image has changed - thx to dmbasso

if [ -e "$PREFIX$OUTPUT" ]; then
   rm "$PREFIX$OUTPUT"
   OUTPUT="$APPEND$OUTPUT"
else
   rm "$PREFIX$APPEND$OUTPUT"
fi

if [ -z $PROJECTION ]; then 
xplanet -num_times 1 -output "$PREFIX$OUTPUT" -geometry $GEOMETRY -longitude $LONGITUDE -latitude $LATITUDE
else
xplanet -num_times 1 -output "$PREFIX$OUTPUT" -geometry $GEOMETRY -longitude $LONGITUDE -latitude $LATITUDE -projection $PROJECTION
fi

#update Gnome backgound
gconftool -t str -s /desktop/gnome/background/picture_filename "$PREFIX$OUTPUT"

#sleep $DELAY
#exec $0
