" Set compatibility to Vim only.
"set nocompatible
set rnu
set ruler
set cursorline
set showmatch
set clipboard=unnamed
set mouse=a
set sw=2
set noshowmode
set numberwidth=2
" Helps force plug-ins to load correctly when it is turned back on below.
"filetype off

" Turn on syntax highlighting.
syntax on 

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd


" Show line numbers
set number

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Automatically save and load folds
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
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
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
set background=dark
colorscheme gruvbox 
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = "hard"
let NERDTreeQuitOnOpen=1
"let g:airline#extensions#tabline#enabled = 1
let g:coc_global_extensions = [ 'coc-tsserver','coc-emmet','coc-html','coc-css','coc-json','coc-git','coc-json' ]
"let g:airline_powerline_fonts = 1
" GoTo code navigation.
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
:imap ii <Esc>
:vmap <C-C> "+y
:vmap <C-V> "+p
