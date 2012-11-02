#!/bin/bash

vimdir=`pwd`

# get and setup submodules
git submodule update --init
git submodule foreach git checkout master

# add own github forks to plugins for pushing
git --git-dir=bundle/Dim/.git remote -v add ssh git@github.com:juhasz/Dim.git
git --git-dir=bundle/drupal_snippets/.git remote -v add ssh git@github.com:juhasz/drupal-snippets.git
git --git-dir=bundle/mmd_vim/.git remote -v add ssh git@github.com:juhasz/mmd_vim.git

# create backup and undo directory
mkdir undodir backupdir

# create an empty file in doc directory for markdown plugin, fix a pathogen bug
touch bundle/vim_markdown/doc/EmptyFileForFixPathogen.txt

# create symlinks for vimrc, gvimrc and ctags config file
rm ~/.ctags
ln -s $vimdir/vimrc ~/.vimrc.after
ln -s $vimdir/gvimrc ~/.gvimrc.after
ln -s $vimdir/ctags ~/.ctags

exit 0
