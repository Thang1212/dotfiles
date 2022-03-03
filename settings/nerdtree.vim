" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Key maps
nnoremap <C-n> :NERDTreeToggle<CR>

" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * silent NERDTreeMirror

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Change arrow to expand/collapse tree
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '*'
