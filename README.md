
# Overview #

A personal collection of `~/bin` scripts from the PeepCode "Advanced Command Line".

# Installation #

    cd
    mkdir ~/Bin               # if it doesn't already exist
    brew install mercurial
    brew install vcprompt

    mkdir ~/Code
    cd !$
    git clone git://github.com/btoone/homebin.git
    cd homebin
    rake

Running the rake task will create symbolic links to the scripts in your `~/Bin` directory.

# TODO #

* make ~/Bin directory if it doesn't exist