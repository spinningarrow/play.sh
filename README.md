# play.sh

A simple shell script that searches for and plays songs from the command line in OS X. For times when you don't want to open iTunes just to play that one song you really want to listen to.

![play.sh screenshot](https://lh3.googleusercontent.com/-yOzA1RjrxIo/UV4NMKSAlgI/AAAAAAAAAiE/qyKAEG4WYcU/s733/play.sh_2.png)

It uses `find` to search for music and `afplay` to play it. It looks at the file path when searching so having the artist, album and song title in the path will help. In the screenshot above, the music files being displayed are organised like this on the hard drive: `<Artist>/<Album>/<Artist> - <Track number> <Track title>.mp3`.

## Installation

1. [Download the latest version][latest] and unzip it.
2. Open the `play.sh` file in a text editor and change the path of the `MUSIC_DIR` variable to wherever your music files are stored.

NOTE: To easily run the script from anywhere, you can add an alias to it in your bash profile (located at `~/.bash_profile`; you can create it if it doesn't exist) like so:

    alias play=/PATH/TO/play.sh

## Usage

If you added the alias to your shell profile, just type the following command:

    play <part of artist/album/song name>

Otherwise:

1. Open Terminal and navigate to the folder where it was unzipped.
2. Run `./play.sh <part of artist/album/song name>`

To **stop** playback:

    killall -TERM afplay

[latest]: https://github.com/spinningarrow/play.sh/zipball/master