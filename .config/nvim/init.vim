" NeoBundle  {{{
	" Boilerplate {{{
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
	" Boilerplate }}}

		" Git helpers
		  NeoBundle 'tpope/vim-fugitive'
		  NeoBundle 'airblade/vim-gitgutter'

		" File navigation
		  NeoBundle 'scrooloose/nerdtree'
		  NeoBundle 'Xuyuanp/nerdtree-git-plugin'
		  NeoBundle 'ryanoasis/vim-devicons'

		" Syntax
		  NeoBundle 'Shougo/deoplete.nvim'
			let g:deoplete#enable_at_startup = 1
		  
	" Boilerplate {{{
		" Required:
		call neobundle#end()
		filetype plugin indent on
		NeoBundleCheck
		if bundleExists == 0
			echo "Installing Bundles, ignore errors"
		endif
	" Boilerplate }}}
" NeoBundle }}}
" System settings {{{
	syntax enable
" }}}
" Key bindings {{{
	let mapleader = ','
	nnoremap <space> za
	inoremap hj <esc>
	vnoremap hj <esc>
	" Remaps {{{
		vnoremap > >gv
		vnoremap < <gv
		nnoremap Q <nop>
		nnoremap , za
	" Remaps }}}
" Key bindings }}}

" Autocmds {{{
	autocmd FileType vim setlocal foldmethod=marker
	autocmd FileType vim setlocal foldlevel=0
" }}}
