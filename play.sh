#!/bin/bash

MUSIC_DIR=~/Music/Music
args="$@"
songs=$(find $MUSIC_DIR -ipath "*${args}*.mp3")
chars=$(echo -n "$songs" | wc -m | awk {'print $1'})
lines=$(echo "$songs" | wc -l | awk {'print $1'})

if [ $chars -eq "0" ]
then
	echo "No songs found matching '$args'."
elif [ $lines -eq "1" ]
then
	echo "$songs"
	afplay "$(echo -n "$songs")" &
else
	echo "$songs" | nl | grep -i "$args"
	read -p "Play song #" num
		if [ $num = "?" ]; then num=$[$RANDOM % $lines + 1]; fi
		selection=$(echo "$songs" | sed -n "$num"p)
		echo "$selection"
		afplay "$selection" &
fi