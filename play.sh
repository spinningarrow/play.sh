#!/bin/bash

# The directory where you would like to search for music files; change
# to wherever you keep your music
if [[ -z $MUSIC_DIR ]]
then
	MUSIC_DIR=~/Music
fi

# Get arguments passed in
args="$@"

# Find mp3 files that contain args
songs=$(find -E "$MUSIC_DIR" -iregex ".*${args}.*(mp3|m4a|wav)")

# Count the number of files found
chars=$(echo -n "$songs" | wc -m | awk {'print $1'})
lines=$(echo "$songs" | wc -l | awk {'print $1'})

# No songs found
if [ $chars -eq "0" ]
then
	echo "No songs found matching '$args'."
	exit $?

# Only one result
elif [ $lines -eq "1" ]
then
	selection="$songs"

# Multiple results
# Show line numbers in front of each result and prompt the user to
# choose which song to play
# User can also enter '?' to choose one of the results at random
else
	echo "$lines songs found matching '$args':"
	echo
	echo "$songs" | while read song; do echo ${song#$MUSIC_DIR/}; done | sed 's:/: › :g' | nl | grep -i "$args"
	echo

	# Prompt the user to choose a song
	while :
	do
		read -p "Choose the song to be played ('?' for random selection): " num

		# User provided no input - play the first song
		if [ -z "$num" ]; then
			num=1
			break

		# User entered '?' - choose a random song to play
		elif [ $num = "?" ]; then
			num=$[$RANDOM % $lines + 1]
			break

		# User input is not within range (or it's something else) - ask them
		# to try again
		elif [[ ! ($num -ge 1 && $num -le $lines) ]]; then
			echo "Incorrect input! Please try again."

		# User input is a number within the range, let's get out of the loop
		else
			break
		fi
	done

	selection=$(echo "$songs" | sed -n "$num"p)
	echo
fi

# Play the song in the background
# Playback can be stopped using `killall -TERM afplay`
echo "Playing: ${selection#$MUSIC_DIR/}" | sed 's:/: › :g'
afplay "$selection" &