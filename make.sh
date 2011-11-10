#!/bin/bash

vimdir=`pwd`

# get and setup submodules
git submodule update --init
git submodule foreach git checkout master

# create backup and undo directory
mkdir undodir backupdir

# create an empty file in doc directory for markdown plugin, fix a pathogen bug
touch bundle/vim_markdown/doc/EmptyFileForFixPathogen.txt

# setup command-t plugin
cd bundle/commandT/ruby/command-t
ruby extconf.rb
make
cd $vimdir

# create symlinks for vimrc and gvimrc
rm ~/.vimrc ~/.gvimrc
ln -s $vimdir/vimrc ~/.vimrc
ln -s $vimdir/gvimrc ~/.gvimrc

exit 0
