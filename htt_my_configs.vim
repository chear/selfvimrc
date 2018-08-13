"
" Fantastic Vim Configration
"

"shows line number
set number

" shows GBK and GB2312
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8    
set encoding=utf-8     
let g:go_version_warning = 0




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




"Plug of vim-hsftp, path at : ~/.vim_runtime/vim-hsftp.vim
"nmap <F10> :Hupload<cr>
"nmap <F11> :Hdownload<cr>




"Mapping 'F9' to close windows both 'location list' and 'quckfix', ccl means Close the quickfix window , lcl means to close window showing the location list.
nmap <F9> :windo lcl\|ccl<cr>
""Mapping 'ctrl' + 'Up' to switch up window
"nmap <C-Up> :<C-w-k><cr>
""Mapping 'ctrl' + 'Down' to switch down  window
"nmap <C-Down> :<C-w-j><cr>
""Mapping 'ctrl' + 'Up' to switch right window
"nmap <C-Right> :<C-w-h><cr>
""Mapping 'ctrl' + 'Down' to switch left window
"nmap <C-Left> :<C-w-l><cr>
""Mapping 'F12' to show the history of vim command
"nmap <F12> :q:<cr>
"

"Display the shell result in vim window
function! s:ExecuteInShell(command)
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    silent! execute 'resize '
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
    echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ S call s:ExecuteInShell(<q-args>)
