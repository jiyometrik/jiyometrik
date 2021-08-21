" PLUGINS - VimPlug
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " language servers and all that fun stuff
" Note: If you're using coc-pyright (like me), be sure to run `sudo apt install python-is-python3`, so that formatting actually works.
Plug 'tpope/vim-fugitive'  " Yet another Git Integration for Git Commands
Plug 'airblade/vim-gitgutter' " Git Integration for Diffs
Plug 'preservim/nerdtree'  " File Tree
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git for File Tree
Plug 'vim-airline/vim-airline'  " Status Bar
Plug 'jiangmiao/auto-pairs'  " autocomplete matching brackets
" Plug 'arcticicestudio/nord-vim'  " Nord Theme
Plug 'morhetz/gruvbox'  " gruvbox theme
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
" let g:airline_powerline_fonts = 1  " enable powerline fonts

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
" let g:nord_bold_vertical_split_line = 1  " bold vertical-split line
" let g:nord_uniform_diff_background = 1  " uniform diff background
" let g:nord_italic = 1
" let g:nord_italic_comments = 1
" colorscheme nord

" Gruvbox

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
	if (has("nvim"))
		" For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	" For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
	" Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
	" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
	if (has("termguicolors"))
		set termguicolors
	endif
endif

let g:gruvbox_italic = 1
colorscheme gruvbox
