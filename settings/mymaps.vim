" Takuya setup (key map) "{{{
" ---------------------------------------------------------------------

" Select all
nmap <C-a> gg<S-v>G
" Copy all
nmap <C-y> :%y+<Return>
" Close recent tab
nmap cl :close<Return>
" Open terminal mode in gVim
nmap <C-t> :terminal<Return>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------
" Tabs

" Open current directory
nmap tn :tabnew
nmap ce :e .<Return>
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>
"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
"map s<left> <C-w>h
"map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

"------------------------------
" Terminal 
tnoremap <C-q> <C-\><C-n>:q!<Return>

"}}}
