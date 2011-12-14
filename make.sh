#!/bin/bash

vimdir=`pwd`

# get and setup submodules
git submodule update --init
git submodule foreach git checkout master

# add own github forks to plugins for pushing
git --git-dir=bundle/DBGp_Remote_Debugger_Interface/.git remote -v add ssh git@github.com:juhasz/DBGp-Remote-Debugger-Interface.git
git --git-dir=bundle/Dim/.git remote -v add ssh git@github.com:juhasz/Dim.git
git --git-dir=bundle/drupal_snippets/.git remote -v add ssh git@github.com:juhasz/drupal-snippets.git
git --git-dir=bundle/mmd_vim/.git remote -v add ssh git@github.com:juhasz/mmd_vim.git
git --git-dir=bundle/vimLaTex/.git remote -v add ssh git@github.com:juhasz/vimLaTeX.git

# create backup and undo directory
mkdir undodir backupdir

# create an empty file in doc directory for markdown plugin, fix a pathogen bug
touch bundle/vim_markdown/doc/EmptyFileForFixPathogen.txt

# setup command-t plugin
cd bundle/commandT/ruby/command-t
ruby extconf.rb
make
cd $vimdir

# create symlinks for vimrc, gvimrc and ctags config file
rm ~/.vimrc ~/.gvimrc ~/.ctags
ln -s $vimdir/vimrc ~/.vimrc
ln -s $vimdir/gvimrc ~/.gvimrc
ln -s $vimdir/ctags ~/.ctags

exit 0
