" PLUGINS - VimPlug
call plug#begin('~/.config/nvim/plugged')

" Language Servers
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Check coc-settings.json

" Git Integration
Plug 'tpope/vim-fugitive'  " Yet another Git Integration for Git Commands
Plug 'airblade/vim-gitgutter' " Git Integration for Diffs

" FileTree (+ git integration)
Plug 'preservim/nerdtree' " file tree
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git for File Tree

" Status Bar
Plug 'vim-airline/vim-airline'

" Misc.
Plug 'jiangmiao/auto-pairs'  " autocomplete matching brackets

" Themes
Plug 'arcticicestudio/nord-vim'  " Nord Theme

" Icons for Everything
Plug 'ryanoasis/vim-devicons'  " Icons!

call plug#end()

set number  " line numbers for my sanity
set relativenumber  " helps with navigating with j/k
syntax enable  " enable syntax highlighting

set tabstop=4  " use tabs, not spaces
set shiftwidth=4  " we're not savages, use the same spacing
set autoindent  " saves time
set smartindent
set showmatch  " show matching brackets

set nocompatible

set path+=**
set wildmenu  " builtin file finder

" set leader key to be more accessible
let mapleader = ","

" ctrl-a to select all
nnoremap <C-a> <Esc>ggVG

" prettier formatting configs are in ~/.prettierrc
" as for the other languages, just use the language servers provided by coc.nvim
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <C-f> :Prettier<CR>

" -- NERDTree Remaps --
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <Space>f :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
		\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:airline#extensions#tabline#enabled = 1  " enable top bar for vim-airline
" let g:airline_powerline_fonts = 1  " enable powerline fonts

" Fast Escape for vim-airline
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
let g:nord_italic = 1  " use italics - only use this if your font supports italics
let g:nord_italic_comments = 1
colorscheme nord
