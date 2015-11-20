" Setup NeoBundle  ----------------------------------------------------------{{{
" If vundle is not installed, do it first

let bundleExists = 1
if (!isdirectory(expand("$HOME/.nvim/bundle/neobundle.vim")))
call system(expand("mkdir -p $HOME/.nvim/bundle"))
call system(expand("git clone https://github.com/Shougo/neobundle.vim ~/.nvim/bundle/neobundle.vim"))
let bundleExists = 0
endif


if 0 | endif

if has('vim_starting')
if &compatible
" Be iMproved
set nocompatible
endif

" Required:
set runtimepath+=~/.nvim/bundle/neobundle.vim/
" set runtimepath+=~/.nvim/bundle/bolt.vim/
endif

" Required:
call neobundle#begin(expand('~/.nvim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Required:
filetype plugin indent on
NeoBundleCheck
if bundleExists == 0
echo "Installing Bundles, ignore errors"
endif

" }}}

" Key bindings {{{
inoremap hj <esc>
" }}}

" Autocmds {{{
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0
" }}}