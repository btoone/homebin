
# Overview #

A personal collection of `~/bin` scripts from the PeepCode "Advanced Command Line".

# Installation #

    mkdir ~/code
    cd !$
    git clone git://github.com/btoone/homebin.git
    cd homebin
    rake install

Running the rake task will create symbolic links to the scripts in your `~/bin` directory.  The task will also install vcprompt from source.  If it fails, you can manually run the installer.

    ./vcprompt-install    # requires mercurial

Note: The environment variable $PYTHONPATH needs to be set before running the installer.

# TODO #

* make ~/bin directory if it doesn't exist
* make sure you're running from the ~/bin dir or cd into it
