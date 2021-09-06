" Config file for Neovim.
" Directory: ~/.config/nvim

" PLUGINS - VimPlug
call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release' }  " autocomplete and all that fun stuff
Plug 'sheerun/vim-polyglot'  " syntax highlighting
Plug 'tpope/vim-fugitive'  " git from vim
Plug 'mhinz/vim-signify'  " faster version?
Plug 'preservim/nerdtree'  " file tree
Plug 'Xuyuanp/nerdtree-git-plugin'  " git status for file tree
Plug 'vim-airline/vim-airline'  " status bar
Plug 'edkolev/tmuxline.vim'
Plug 'jiangmiao/auto-pairs'  " autocomplete matching brackets
" Plug 'sainnhe/gruvbox-material'
Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'  " Icons for Everything
call plug#end()

set number  " line numbers for my sanity
set relativenumber  " helps with navigating with j/k
syntax enable  " enable syntax highlighting

set tabstop=4  " use tabs, not spaces
set shiftwidth=4
set smartindent
set showmatch  " show matching brackets

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
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <Space>f :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
		\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1  " enable top bar for vim-airline

" Fast Escape for vim-airline
if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif

" if (has("nvim"))
	" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif
if (has("termguicolors"))
	set termguicolors
endif

" Gruvbox Material
" let g:gruvbox_material_enable_italic = 1
" colorscheme gruvbox-material

" Nord
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
colorscheme nord
