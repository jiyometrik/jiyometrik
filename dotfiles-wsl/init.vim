" PLUGINS - VimPlug
call plug#begin('~/.config/nvim/plugged')

" Language Servers
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Installed | coc-html, coc-css, coc-clangd (c/cpp), coc-emmet, coc-prettier, coc-tsserver, coc-pyright, coc-python, coc-eslint (I keep both because both have lacking features which can be found in one another)
" Make sure to run sudo apt install python-is-python3 when installing pyright,
" so that formatting actually works.
" Check coc-settings.json

" Git Integration
Plug 'tpope/vim-fugitive'  " Yet another Git Integration for Git Commands
Plug 'airblade/vim-gitgutter' " Git Integration for Diffs

" FileTree (+ git integration)
Plug 'preservim/nerdtree' " file tree
" Plug 'kyazdani42/nvim-tree.lua'  " a faster version for nvim, but I prefer the original
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git for File Tree

" Status Line (vim-airline is quite slow for Neovim, so I'm using the faster alternative)
" Plug 'vim-airline/vim-airline'  " Status Bar
Plug 'hoob3rt/lualine.nvim'  " tabline for nvim

" Misc.
Plug 'jiangmiao/auto-pairs'  " autocomplete matching brackets

" Nord Theme
Plug 'arcticicestudio/nord-vim'  " Nord Theme

" Icons for Everything
Plug 'ryanoasis/vim-devicons'  " Icons!

call plug#end()

" Lua Scripts (for Neovim extensions which require them)
lua <<EOF
-- configure theme for status line
require 'lualine'.setup {
	options = {theme = 'nord'}
}
EOF

set number  " line numbers for my sanity
set relativenumber
syntax enable  " enable syntax highlighting

set tabstop=4  " use tabs, not spaces
set shiftwidth=4
set autoindent
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

" Remaps for File Tree
" -- NERDTree Remaps --
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <Space>f :NERDTreeFind<CR>

" -- NvimTree Remaps --
" nnoremap <C-n> :NvimTreeOpen<CR>
" nnoremap <C-t> :NvimTreeToggle<CR>
" nnoremap <leader>n :NvimTreeFocus<CR>
" nnoremap <Space>f :NvimTreeFind<CR>

" Other Configs for NERDTree's behaviour.
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Configs for vim-airline, if you choose to use it
" let g:airline#extensions#tabline#enabled = 1  " enable top bar for vim-airline
" let g:airline_powerline_fonts = 1  " enable powerline fonts

" Fast Escape for vim-airline
" if ! has('gui_running')
	" set ttimeoutlen=10
	" augroup FastEscape
		" autocmd!
		" au InsertEnter * set timeoutlen=0
		" au InsertLeave * set timeoutlen=1000
	" augroup END
" endif

" Nord Theme
let g:nord_bold_vertical_split_line = 1  " bold vertical-split line
let g:nord_cursor_line_number_background = 1  " easier to notice cursor
let g:nord_uniform_diff_background = 1  " uniform diff background
colorscheme nord
