" PLUGINS - VimPlug
call plug#begin('~/.config/nvim/plugged')

" Language Servers
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Installed | coc-html, coc-css, coc-clangd (c/cpp), coc-emmet, coc-prettier, coc-tsserver, coc-pyright, coc-eslint
" Make sure to run sudo apt install python-is-python3 when installing pyright,
" so that formatting actually works.
" Check coc-settings.json

" Git Integration
Plug 'tpope/vim-fugitive'  " Yet another Git Integration for Git Commands
Plug 'airblade/vim-gitgutter' " Git Integration for Diffs

" FileTree (+ git integration)
Plug 'preservim/nerdtree' " file tree
Plug 'Xuyuanp/nerdtree-git-plugin'  " Git for File Tree

" Status Line (vim-airline is quite slow for Neovim, so I'm using the faster alternative)
Plug 'vim-airline/vim-airline'  " Status Bar
" Plug 'yaocccc/nvim-lines.lua'

" Misc.
Plug 'jiangmiao/auto-pairs'  " autocomplete matching brackets

" Themes
" Plug 'arcticicestudio/nord-vim'  " Nord Theme
Plug 'morhetz/gruvbox'  " gruvbox theme

" Icons for Everything
Plug 'ryanoasis/vim-devicons'  " Icons!

call plug#end()

" Lua Scripts (for Neovim extensions which require them)
lua <<EOF
-- configure theme for status line
-- vim.g.line_powerline_enable = 1
-- vim.g.line_nerdfont_enable = 1
-- vim.g.line_unnamed_filename='~'
-- vim.g.line_statusline_getters = {'v:lua.GitInfo', 'v:lua.CocErrCount', 'v:lua.GetFt'}
-- function GitInfo()
	-- local branch = vim.g.coc_git_status or ''
	-- local diff = vim.b.coc_git_status or ''
	-- return (string.len(branch) > 0 and string.format(" %s ", branch) or "")
		-- .. (string.len(diff) > 0 and string.format('%s ', vim.fn.trim(diff)) or '')
-- end
-- function CocErrCount()
	-- local coc_diagnostic_info = vim.b.coc_diagnostic_info or { error = 0 }
	-- return string.format(' E%d ', coc_diagnostic_info.error)
-- end
-- function GetFt()
	-- local ft = vim.api.nvim_eval('&ft')
	-- return string.format(' %s ', string.len(ft) > 0 and ft or '~')
-- end
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

" Other Configs for NERDTree's behaviour.
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
		\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Configs for vim-airline, if you choose to use it
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
