#!/usr/bin/env bash

# Installs utility gems for the home environment

echo -e "\nINFO: Installing framework gems"
gem install rails

echo -e "\nINFO: Installing developer gems"
gem install awesome_print
gem install cheat
gem install pry
gem install pry-nav
gem install travis
gem install travis-lint
gem install hl
gem install foreman
gem install launchy

echo -e "\nINFO: Installing environment gems"
gem install rake
gem install tmuxinator

echo -e "\nINFO: Installing provisioning gems"
gem install knife-solo
gem install knife-github-cookbooks
gem install knife-ec2
gem install librarian

echo -e "\nFINISHED: Remember to run `rbenv rehash` if using rbenv"
