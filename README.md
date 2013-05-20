
TODO: Do I need a gemfile for the tests? Or should I just rely on gems already
      installed? 

TODO: Should I have a spec folder for this project? I think if I'm going to have a gemfile then it
makes sense to have a folder for specs as well. But then the command line apps would be turning into
a larger project and then maybe each one should be extracted out into its own project.

Overview
========

A personal collection of `~/bin`.

Some of these scripts are from the excellent PeepCode [Advanced Command
Line](https://peepcode.com/products/advanced-command-line).

Installation
============

    git clone git://github.com/caspyin/homebin.git
    cd homebin
    rake install

Running the rake task will create symbolic links to the scripts in your `~/bin`
directory.

Installers
----------

This project has a few extra installers located in the `installers` directory.
It is recommended that you run each manually but there is also a rake task if
you're feeling lucky.

    rake install:all

