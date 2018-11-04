" deoplete.nvim for autocompletion
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/space-vim-dark'
"Plug 'kien/ctrlp'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] },
  Plug 'junegunn/fzf.vim', { 'dir': '~/.fzf', 'do': './install --all' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/fzf.vim'
endif
"let g:deoplete#enable_at_startup = 1

