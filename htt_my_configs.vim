"
" Fantastic Vim Configration
"


"shows line number
set number

" shows GBK and GB2312
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8    
set encoding=utf-8     



"Plugin of 'NERDTree' setting
let NERDTreeWinPos='right'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>




"Plugin of 'ctrlp' setting
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" 设置过滤不进行查找的后缀名 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'




"Plugin of 'bufexplorer' setting
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.

let NERDTreeWinPos='top'
let NERDTreeWinSize=30 
map <F3> :BufExplorer<cr>




"Plugin of 'YCM'(YourComplayMe)
" 设置跳转到方法/函数定义的快捷键 
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR> 
" 触发补全快捷键 
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>'] 
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>'] 
let g:ycm_auto_trigger = 1 
" 最小自动触发补全的字符大小设置为 3 
let g:ycm_min_num_of_chars_for_completion = 3 
" YCM的previw窗口比较恼人，还是关闭比较好 
set completeopt-=preview 




"Plugin of 'vim-airline' setting
let g:airline_powerline_fonts = 1 




"Plugin of 'LocationList', F11 mapping to close LocationList window.
nmap <F9> :windo lcl\|ccl<cr>



"Plugin of vim-hsftp
nmap <F10> :Hupload<cr>
nmap <F11> :Hdownload<cr>

