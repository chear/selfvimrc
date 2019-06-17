## The original git repo by
git clone https://github.com/amix/vimrc 


## Make self configration for Chear  ^()^
Just do following:
* 1) git clone https://github.com/chear/selfvimrc.git  ~/.vim_runtime
* 2) sh ~/.vim_runtime/install_chear_vimrc.sh 


## Use hsftp for update & download to server by chear 
As following:
* 1) create .hsftp on your workspace
        host   172.25.24.233
        user   chear  
        pass   test123
        port   22
        remote /var/www/
        confirm_download 0
        confirm_upload 0
        Commands

* 2) comand to upload or download 
:Hdownload
Downloads current file from remote path

:Hupload
Uploads current file to remote path

:Hupdir
Uploads current folder of current buffer to remote path

ref:
https://github.com/chear/vim-hsftp


## Universal Ctags
universal-ctags is replacement for exuberant-ctags
the ctags parser files at ~/.vim_runtime/ctags_parser/ , copy ./ctags_parser/* to  ~/.myctags/* when use it.
for example
```
ctags --options=NONE --options=~/.myctags/linux.ctags --langmap=c:+.h --extras=+q --if0=no -o c_tags -R ;

```
