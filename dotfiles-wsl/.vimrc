" PLUGINS - VimPlug
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " language servers and all that fun stuff
Plug 'tpope/vim-fugitive'  " Yet another Git Integration for Git Commands
Plug 'airblade/vim-gitgutter' " Git Integration for Diffs
Plug 'preservim/nerdtree'  " File Tree
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git for File Tree
Plug 'vim-airline/vim-airline'  " Status Bar
Plug 'jiangmiao/auto-pairs'  " autocomplete matching brackets
Plug 'morhetz/gruvbox'  " gruvbox
Plug 'ryanoasis/vim-devicons'  " Icons!
call plug#end()

set number  " line numbers for my sanity
set relativenumber
set bg=dark
syntax on  " enable syntax highlighting

set tabstop=4  " use tabs, not spaces
set shiftwidth=4
set autoindent
set smartindent
set showmatch  " show matching brackets

set nocompatible

set path+=**
set wildmenu  " file finder

" set leader key to be more accessible
let mapleader = ","

" ctrl-a to select all
nnoremap <C-a> <Esc>ggVG

" formatting configs, either prettier/language server
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

" Fast Escape for Status Bar
if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif

if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
	set termguicolors
endif

let g:gruvbox_italic = 1
colorscheme gruvbox
