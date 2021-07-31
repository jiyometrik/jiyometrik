syntax on  " syntax highlighting

set tabstop=4  " use tabs, not spaces
set shiftwidth=4
set number  " line numbers for my sanity

filetype indent on  " file-specific indentation

set lazyredraw  " stop unnecessary redrawing
set showmatch  " show matching brackets

" PLUGINS - VimPlug
call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'  " Nord Theme
Plug 'preservim/nerdtree'  " File Tree
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git for File Tree
Plug 'airblade/vim-gitgutter'  " Git Integration
Plug 'vim-airline/vim-airline'  " Status Bar
Plug 'jiangmiao/auto-pairs'  " autocomplete matching brackets
call plug#end()

" Remaps for File Tree
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:airline_powerline_fonts = 1  " allow powerline fonts for status bar

let g:nord_bold_vertical_split_line = 1  " bold vertical-split line
let g:nord_uniform_diff_background = 1  " uniform diff background
let g:nord_italic = 1  " italics
let g:nord_italic_comments = 1  " italic comments
colorscheme nord  " set nord colorscheme
