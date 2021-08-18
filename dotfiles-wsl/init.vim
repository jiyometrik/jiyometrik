" PLUGINS - VimPlug
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Installed | coc-html, coc-css, coc-clangd (c/cpp), coc-emmet, coc-prettier, coc-tsserver, coc-pyright, coc-python (I keep both because both have lacking features which can be found in one another)
" Check coc-settings.json

Plug 'tpope/vim-fugitive'  " Yet another Git Integration for Git Commands
Plug 'airblade/vim-gitgutter' " Git Integration for Diffs
Plug 'preservim/nerdtree'  " File Tree
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git for File Tree
Plug 'vim-airline/vim-airline'  " Status Bar
Plug 'jiangmiao/auto-pairs'  " autocomplete matching brackets
Plug 'arcticicestudio/nord-vim'  " Nord Theme
Plug 'ryanoasis/vim-devicons'  " Icons!
call plug#end()

set number  " line numbers for my sanity
syntax enable  " enable syntax highlighting

set tabstop=4  " use tabs, not spaces
set shiftwidth=4
set autoindent
set smartindent
set showmatch  " show matching brackets

set nocompatible

set path+=**
set wildmenu  " file finder

set noruler noshowcmd " faster

let mapleader = ","

" prettier formatting configs are in ~/.prettierrc
" as for the other languages, just use the language servers provided by coc.nvim
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <C-f> :Prettier<CR>

" Remaps for File Tree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <Space>f :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
	\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:airline#extensions#tabline#enabled = 1  " enable top bar for vim-airline
let g:airline_powerline_fonts = 1  " enable powerline fonts

" Fast Escape for Status Bar
if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif

" Nord Theme
let g:nord_bold_vertical_split_line = 1  " bold vertical-split line
let g:nord_uniform_diff_background = 1  " uniform diff background
colorscheme nord  " set nord colorscheme
