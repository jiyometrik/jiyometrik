" g-e-o-m-e-t-r-i-c's ~/.config/nvim/init.vim - config file for Neovim.
" Directory: ~/.config/nvim

" PLUGINS - VimPlug
call plug#begin('~/.config/nvim/plugged')

" Language Servers and Autocomplete
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'sheerun/vim-polyglot'  " Better Syntax Highlighting

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'  " Git Diffs in the gutter

" File Tree
Plug 'preservim/nerdtree'

" Status Lines
Plug 'vim-airline/vim-airline'  " status bar

" Misc.
Plug 'jiangmiao/auto-pairs'  " autocomplete matching brackets

" Appearance
Plug 'dylanaraps/wal.vim'
Plug 'ryanoasis/vim-devicons'  " Icons for Everything
call plug#end()

set number  " line numbers for my sanity
set relativenumber  " helps with navigating with j/k
syntax enable  " enable syntax highlighting

set tabstop=4  " use tabs, not spaces
set shiftwidth=4
set smartindent
" set showmatch  " show matching brackets

set path+=**
set wildmenu  " builtin file finder

let mapleader = ","  " set leader key to be more accessible

" ctrl-a to select all
nnoremap <C-a> <Esc>ggVG

" formatting configs - either in ~/.prettierrc or respective language servers
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <C-f> :Prettier<CR>

" NERDTree Remaps
" nnoremap <leader>n :NERDTreeFocus<CR>
" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <Space>f :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
		" \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Close the tab if NERDTree is the only window remaining in it.
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:airline_powerline_fonts = 1  " Use powerline fonts.
let g:airline#extensions#tabline#enabled = 1  " enable top bar for vim-airline

" Fast Escape for vim-airline
" This allows the status bar to respond faster whenever we change Vim modes.
if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif

colorscheme wal  " enables pywal integration
