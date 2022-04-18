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

" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Leader Keys -  Automatically save and load folds
let mapleader = ","
noremap <leader>w :w<cr>
noremap <leader>fm :Autoformat<CR>
noremap <leader>gs :CocSearch
" Tree Finder
noremap <leader>fs :NERDTreeFind<cr>
noremap <leader>fo :NERDTree<cr>
noremap <C-p> :GFiles<CR>
noremap <leader>pf :Files<cr>
noremap <leader>eq :q<cr>
noremap <leader>fq :q!<cr>
noremap <leader>bp :bp<cr>
noremap <leader>bo :bn<cr>
noremap <leader>go   :!google-chrome-stable %<cr>
nmap <leader>s <Plug>(easymotion-s2)
" noremap <leader><cr> <cr><c-w>h:q<cr>

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
" Plug 'pangloss/vim-javascript'    " JavaScript support
" Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'ryanoasis/vim-devicons'
" Plug 'ThePrimeagen/vim-be-good'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'Chiel92/vim-autoformat'
" Plug 'puremourning/vimspector'
call plug#end()


" Options, Colors, Fonts, and Syntax
filetype plugin indent on
syntax enable

" Scheme Configuration
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox


" NerdTree
autocmd FileType nerdtree setlocal relativenumber
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1

" Airline
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Coc
let g:coc_global_extensions = [ 'coc-tsserver','coc-emmet','coc-html','coc-css','coc-json','coc-git','coc-python', 'coc-phpls']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Vimspector
" let g:vimspector_enable_mappings = 'HUMAN'

" Map Keys
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
set guifont=DroidSansMono\ Nerd\ Font\ 11
