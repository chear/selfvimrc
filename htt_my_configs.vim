"---------------------------------------------------
" Fantastic Vim Configration
"---------------------------------------------------
"shows line number
set number
" c program indent
set cindent
" search high light
set hlsearch
" shows GBK and GB2312
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8    
set encoding=utf-8     

" n  普通模式
" v  可视模式
" i 插入模式
" c 命令行模式
" h 在帮助文件里，以上所有模式
" a 以上所有模式
" r 跳过|lit-enter|提示
" A 在可是模式下自动选择
set mouse=n

let g:go_version_warning = 0
nmap <C-J> <C-W>h
nmap <C-K> <C-W>j
nmap <C-I> <C-W>k
nmap <C-L> <C-W>l
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



"---------------------------------------------------
" F2 to open Plugin of 'NERDTree' setting
"---------------------------------------------------
map <F2> :NERDTreeToggle<CR>



"---------------------------------------------------
" F4 to save doc 
"---------------------------------------------------
map <F4> :w <CR>



"---------------------------------------------------
" Plugin of 'ctrlp' setting , 'Ctrl + P'
"---------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" 设置过滤不进行查找的后缀名 
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'



"---------------------------------------------------
" Plugin of 'bufexplorer' setting, F3 to open buffer
"---------------------------------------------------
map <F3> :BufExplorer<cr>
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.



"---------------------------------------------------
" Plugin of 'YCM'(YourComplayMe)
" 设置跳转到方法/函数定义的快捷键 
"---------------------------------------------------
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR> 
" 触发补全快捷键 
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>'] 
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>'] 
let g:ycm_auto_trigger = 1 
" 最小自动触发补全的字符大小设置为 3 
let g:ycm_min_num_of_chars_for_completion = 3 
" YCM的previw窗口比较恼人，还是关闭比较好 
set completeopt-=preview 



"---------------------------------------------------
" Plugin of 'vim-airline' setting
"---------------------------------------------------
let g:airline_powerline_fonts = 1 



"---------------------------------------------------
" Plug of vim-hsftp, path at : ~/.vim_runtime/vim-hsftp.vim, 
" configure file '.hsftp' at workspace
"---------------------------------------------------
nmap <F10> :Hupload<cr>
"nmap <F11> :Hdownload<cr>



"---------------------------------------------------
" Mapping 'F9' to close windows both 'location list' and 'quckfix', 
" ccl means Close the quickfix window , 
" lcl means to close window showing the location list.
"---------------------------------------------------
"nmap <F9> :windo lcl\|ccl<cr>



"---------------------------------------------------
" Display the shell result in vim window
"---------------------------------------------------
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



"---------------------------------------------------
" Plugin of 'Source Explorer' setting, F8 to open
"---------------------------------------------------
nmap <F8> :SrcExplToggle<CR>



"---------------------------------------------------
" convert decimal to hex , Usage bellowing:
"
"   :Dec2hex 496        Displays 1f0 (hex equivalent of decimal 496).
"   :Dec2hex            Converts all decimal numbers to hex in current line.
"   :'<,>'Dec2hex       Same, for all visually selected text (v, V, or ^V).
"   :%Dec2hex           Same       , for all lines in buffer.
"   :Hex2dec 0x1f0      Displays 496 (decimal equival ent of hex 1f0).
"   :Hex2dec 1f0        Same ('0x' is optional in an argument).
"   :Hex2dec            Converts all '0x' hex numbers to decimal in current line.
"   :'<,>'Hex2dec       Same, for all visually selected text (v, V, or ^V).
"   :%Hex2dec           Same, for all lines in buffer.
"---------------------------------------------------
function! s:Dec2hex(line1, line2, arg) range
    if empty(a:arg)
        if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
            let cmd = 's/\%V\<\d\+\>/\=printf("0x%02x",submatch(0)+0)/g'
        else
            let cmd = 's/\<\d\+\>/\=printf("0x%02x",submatch(0)+0)/g'
        endif
        try
            execute a:line1 . ',' . a:line2 . cmd
        catch
            echo 'Error: No decimal number found'
        endtry
    else
        echo printf('%x', a:arg + 0)
    endif
endfunction
command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')


"---------------------------------------------------
" convert hex to decimal.  
"---------------------------------------------------
function! s:Hex2dec(line1, line2, arg) range
    if empty(a:arg)
        if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
            let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
        else
            let cmd = 's/0x\x\+/\=submatch(0)+0/g'
        endif
        try
            execute a:line1 . ',' . a:line2 . cmd
        catch
            echo 'Error: No hex number starting "0x" found'
        endtry
    else
        echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
    endif
endfunction
command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')




"---------------------------------------------------
" pre-load the configration file 
"---------------------------------------------------
"function! s:PreloadingConfig()
""    if filereadable("./.previm")  
"        source .previm
""    endif
"endfunction
"command! call s:PreloadingConfig()



"---------------------------------------------------
" Plugin of 'taglist' setting, F7 to open
"---------------------------------------------------
filetype on 
nmap <F7> :TlistToggle<CR>
let Tlist_Ctags_Cmd = "/home/chear/bin/ctags"


