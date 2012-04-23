
# Overview #

A personal collection of `~/bin` scripts from the PeepCode "Advanced Command Line".

# Installation #

    cd
    mkdir ~/Bin           # if it doesn't already exist
    brew install mercurial

    mkdir ~/Code
    cd !$
    git clone git://github.com/btoone/homebin.git
    cd homebin
    rake

Running the rake task will create symbolic links to the scripts in your `~/bin` directory.  The task will also install vcprompt from source.  If it fails, you can manually run the installer.

    ./vcprompt-install    # requires mercurial

Note: You'll need to have mercurial installed before running the vcprompt-installer.

# TODO #

* make ~/bin directory if it doesn't exist
* make sure you're running from the ~/bin dir or cd into it
* check for mercurial installation
* create a symlink for the `mate` command if one doesn't exist. Command => `ln -s /Applications/TextMate.app/Contents/Resources/mate ~/bin/mate`