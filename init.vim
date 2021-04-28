"set nocompatible
set rnu
set ruler " Show the cursor position
set cursorline
set showmatch
set clipboard=unnamed
set mouse=a
set sw=2
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set numberwidth=2
" Helps force plug-ins to load correctly when it is turned back on below.
"filetype off
set scrolloff=5 " Display 5 lines above/below the cursor when scrolling with a mouse.
set ttyfast " Speed up scrolling in Vim
set laststatus=2 " Status bar
" Display options
set showmode
set showcmd
set number " Show line numbers
set encoding=utf-8 " Encoding
set hlsearch " Highlight matching search patterns
set incsearch " Enable incremental search
set ignorecase " Include matching uppercase words with lowercase search term
set smartcase " Include only uppercase words with uppercase search term
set viminfo='100,<9999,s100 " Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.

" Leader Keys -  Automatically save and load folds
let mapleader = ","
noremap <leader>w :w<cr>
noremap <leader>fm :Autoformat<CR>
noremap <leader>gs :CocSearch
noremap <leader>fs :NERDTreeFind<cr>
noremap <leader>fo :NERDTree<cr>
noremap <leader>eq :q<cr>
noremap <leader>fq :q!<cr>
noremap <leader>bp :bp<cr>
noremap <leader>bo :bn<cr>
nmap <leader>s <Plug>(easymotion-s2)
noremap <leader><cr> <cr><c-w>h:q<cr>

" Map Keys
:imap ii <Esc>
:vmap <C-C> "+y
:vmap <C-V> "+p

" Create Folder Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox'
Plug 'gilgigilgil/anderson.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'Chiel92/vim-autoformat'
call plug#end()


" Options, Colors, Fonts, and Syntax
filetype plugin indent on
syntax enable

" Scheme Configuration
colorscheme gruvbox 
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = "hard"


# NerdTree
autocmd FileType nerdtree setlocal relativenumber
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1

" Airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

" Coc
let g:coc_global_extensions = [ 'coc-tsserver','coc-emmet','coc-html','coc-css','coc-json','coc-git','coc-json' ]
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)



" Map Keys
