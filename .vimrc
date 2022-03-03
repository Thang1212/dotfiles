" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" William setup  "{{{
" ---------------------------------------------------------------------
source $VIMRUNTIME/vimrc_example.vim

colo darkblue

au GUIEnter * simalt ~x
syntax enable
set ignorecase
set lazyredraw
set hls
set is
set cb=unnamed
set gfn=Fixedsys:h18
set ts=4
set sw=4
set si
set smarttab
set nocompatible

scriptencoding utf-8

set autoread
au CursorHold * checktime

" Disable backup
set nobackup
set nowb
set noswapfile
set noundofile

cd D:\WorkSpace
set autochdir

" Compile c++ and Competitive Programming
"autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++17 % -o %:r -Wl,--stack,268435456<CR>
autocmd BufNewFile *.cpp 0r ~\vimfiles\settings\Templates\skeleton.cpp 
autocmd filetype cpp nnoremap <F9> :w <bar> !g++ % -o %:r -O2 -Wall -Wl,--stack=268435456 -Wextra -std=c++17 -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -fmax-errors=1<CR>
autocmd filetype cpp nnoremap <F10> :!%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

" templates for html file
autocmd BufNewFile *.html 0r ~\vimfiles\settings\Templates\skeleton.html

set nu
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

"}}}

" Plugin for not suffered 
call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/AutoComplPop'
Plug 'preservim/nerdTree'
call plug#end()

" Extended settings
let gvim_settings_dir='~\vimfiles\settings\'
execute 'source '.gvim_settings_dir.'mypopup.vim'
execute 'source '.gvim_settings_dir.'mymaps.vim'
execute 'source '.gvim_settings_dir.'nerdtree.vim'
