# play.sh

A simple shell script that searches for and plays songs from the command line in OS X. For times when you don't want to open iTunes just to play that one song you really want to listen to.

![play.sh screenshot](https://lh5.googleusercontent.com/-fb0pTE8158A/UV227blOWwI/AAAAAAAAAh0/YAL6yT6_aZM/s873/play.sh.png)

It uses `find` to search for music and `afplay` to play it. It looks at the file path when searching, so having the artist, album and song title in the path helps.

## Installation

[Download the latest version][latest] and unzip it.

To easily run the script from anywhere, you can add an alias to it in your bash profile (located at `~/.bash_profile`; you can create it if it doesn't exist) like so:

    alias play=/PATH/TO/play.sh

## Usage

If you added the alias to your shell profile, just type the following command:

    play <part of artist/album/song name>
    
Otherwise:

1. Open Terminal and navigate to the folder where it was unzipped.
2. Run `./play.sh <part of artist/album/song name>`

[latest]: https://github.com/spinningarrow/play.sh/zipball/master