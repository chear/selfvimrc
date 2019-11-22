#!/bin/sh
set -e

cd ~/.vim_runtime

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/htt_my_configs.vim
catch
endtry' > ~/.vimrc

cp ./.quiltrc ~/.quiltrc

echo "Installed the Ultimate Vim and Chear's configuration successfully! Enjoy :-)"
