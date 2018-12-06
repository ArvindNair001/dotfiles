"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|


""""""""""""""""""""""""""""""""""""""""""""""
"  => General
""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set t_Co=256
call plug#begin('~/.vim/plugged')
source ~/.vim/plugins.vim	
call plug#end()
syntax on
filetype plugin indent on
set clipboard=unnamedplus
set autoread
set mouse=a
set backspace=indent,eol,start
set hlsearch
set incsearch
set noshowmode " Airline already shows the mode


""""""""""""""""""""""""""""""""""""""""""""""
"  =>  THEMES
""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'
"let g:airline_theme='dracula'
"let g:airline_theme='bubblegum'
"let g:airline_theme='angr'
"let g:airline_theme='aurora'
"let g:airline_theme='kolor'

colorscheme space-vim-dark
"hi Normal guibg=NONE ctermbg=NONE
"colorscheme onedark
set termguicolors
hi LineNr ctermbg=NONE guibg=NONE

""""""""""""""""""""""""""""""""""""""""""""""
" => Keymaps and custom commands
""""""""""""""""""""""""""""""""""""""""""""""

" Set leader key
let mapleader = ","

" Save space-s
nnoremap <leader>s :w<cr>

" Fast saving (forced saving)
nmap <leader>w :w!<cr>

" Quit space-q
nnoremap <leader>q :q!<cr>

" Reload vimrc 
nnoremap <leader>rv :source<Space>$MYVIMRC<cr>

" nnoremap <leader>www :W<cr>
command! W w !sudo tee % > /dev/null 

" NERDTree Mappings
nmap <silent> <leader>k :NERDTreeToggle<cr>
nmap <silent> <leader>y :NERDTreeFind<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t<leader> :tabnext<cr>


"nnoremap <silent> j gj
"nnoremap <silent> k gk

""""""""""""""""""""""""""""""""""""""""""""""
" => UI
""""""""""""""""""""""""""""""""""""""""""""""
set showmatch
let g:deoplete#enable_at_startup = 1



"""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""
" NERDTree settings
let NERDTreeShowHidden=1

" ctrlP(fuzzy Finder) settings
let g:ctrlp_dotfiles=1
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$'
\ }

" Airline Settings 
"let g:airline#extensions#branch#enabled = 0
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#show_buffers = 0
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
"let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
\ } 

"deoplete
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

if has('python3')
	set pyxversion=3
endif
"""""""""""""""""""""""""""""""""""""""""""""
" => 
"""""""""""""""""""""""""""""""""""""""""""""

"Don't redraw while executing macros (good performance config)
set lazyredraw
set ttyfast


set history=500
set showmatch
set autoread 

set number
set rnu
set shiftwidth=4
set tabstop=4

" set 7 lines at bottom
set so=7

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Set leader key
    " let mapleader = "\<Space>"
    let mapleader = ","


" set margin
set foldcolumn=1

set noerrorbells visualbell t_vb=
if has('autocmd')
	autocmd GUIEnter * set visualbell t_vb=
endif


