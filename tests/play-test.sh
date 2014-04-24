#!/usr/bin/env roundup

describe "play.sh"

before() {
	# store user's MUSIC_DIR in a variable
	# create some temporary music files
	mkdir test_music
	touch test_music/Cheetah.mp3
}

after() {
	# remove temporary files
	# reset user's MUSIC_DIR variable
	rm -r test_music
}

it_sets_default_music_dir() {
	# unset MUSIC_DIR and check
	false
}

it_displays_all_songs_if_no_arguments_are_supplied() {
	# check number of lines of result?
	false
}

it_searches_for_mp3_files() {
	false
}

it_searches_for_m4a_files() {
	false
}

it_searches_for_wav_files() {
	false
}

it_display_no_songs_found_message() {
	# specify random args
	test "$foo" "=" "bar"
	false
}

it_plays_the_chosen_song() {
	touch foo.txt
	test -f foo.txt
}

it_plays_a_random_song() {
	test "!" -f foo.txt
}

it_plays_the_first_song() {
	touch foo.txt
	test -f foo.txt
	false
}