"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    MAIN CONFIGURATION                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set rnu
set ruler " Show the cursor position
set cursorline
set showmatch
set clipboard=unnamedplus
set mouse=a
set sw=2
set path+=**
set wildmenu
" set list          " Display unprintable characters f12 - switches
" set listchars=tab:•\ ,trail:•,extends:»,precedes:« " Unprintable chars mapping
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
set wildignore+=**/node_modules/
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

" Set font
set guifont=DroidSansMono\ Nerd\ Font\ 11

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Useful settings
set history=700
set undolevels=700

" Options, Colors, Fonts, and Syntax
filetype plugin indent on
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  KEYMAP CONFIGURATION                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader Keys -  Automatically save and load folds
let mapleader = ","

" Save, quit and force quit
noremap <leader>w :w<cr>
noremap <leader>eq :q<cr>
noremap <leader>fq :q!<cr>
"Git
noremap <C-p> :GFiles<CR>
" Autofomrat
noremap <leader>fm :Autoformat<CR>
" Buffer
noremap <leader>bl :ls<cr>
noremap <leader>bp :bp<cr>
noremap <leader>bo :bn<cr>
noremap <leader>bd :bd<cr>

"Clipboard
:vmap <C-C> "+y
:vmap <C-V> "+p

"Fzf
" nnoremap <silent> ;f <cmd>:Glcd <bar>:Files <cr>
nnoremap <leader>f <cmd>:Files<cr>
nnoremap <silent> ;f <cmd>:Files %:p:h<cr>
nnoremap <leader>r <cmd>:Rg <cr>
" nnoremap <silent> ;r <cmd>:Glcd <bar>:Rg <cr>
nnoremap <silent> ;r <cmd>:lcd%:p:h <bar>:Rg <cr>


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" termguicolors
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

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" set foldmethod=indent
nnoremap <space> za
vnoremap <space> %zf 
vnoremap <leader><space> zf 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  PLUGINS                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Create Folder Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'puremourning/vimspector'
Plug 'liuchengxu/vista.vim'
Plug 'preservim/nerdcommenter'
Plug 'vimwiki/vimwiki'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
" Plug 'nvim-lua/plenary.nvim'
" Plug 'preservim/vim-markdown'
" Plug 'vim-airline/vim-airline'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'tbabej/taskwiki'
Plug 'vim-python/python-syntax'
Plug 'davidhalter/jedi-vim'
Plug 'lepture/vim-jinja'
Plug 'honza/vim-snippets'
Plug 'nikvdp/ejs-syntax'

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 PLUGIN CONFIGURATION  	  	     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" colorscheme gruvbox 
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox

" python-syntax
let g:python_highlight_all = 1
let g:python_slow_sync = 0

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_setConceal = 0
" let g:indentLine_enabled = 1
autocmd Filetype json let g:indentLine_setConceal = 0

"vimwiki
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', '*.wiki']
let g:indentLine_fileTypeExclude = ['vimwiki']
let g:indentLine_bufTypeExclude = ['help', 'terminal', 'vimwiki']

"Easymotion
nmap <leader>s <Plug>(easymotion-s2)

"Vimwiki
nmap <Leader>vs :vs \| :VimwikiIndex<CR>
nmap <Leader><space> :VimwikiGoBackLink<CR>
" let g:vimwiki_list = [{'path': '~/Dropbox/notes'}]
                      
let g:vimwiki_list = [{'path': '~/Dropbox/notes',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
"fix: use vimwiki filetype only for vimwiki files 
let private_wiki = {}
let private_wiki.path = '~/Dropbox/notes'
let private_wiki.syntax = 'markdown'

" noremap <leader>sw :VWS -- i don't remember what is this

" Change filetype based on directory path
 autocmd BufRead,BufNewFile ~/Dropbox/notes/* set syntax=vimwiki

" NerdTree
autocmd FileType nerdtree setlocal relativenumber
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1
noremap <leader>fs :NERDTreeFind<cr>
noremap <leader>fo :NERDTree<cr>

" Vista
nnoremap <silent> ;v <cmd>:Vista <cr>

"Instant Markdown
let g:instant_markdown_autostart = 0
let g:instant_markdown_port = 8888


" Airline
" let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

" Coc
let g:coc_global_extensions = [ 'coc-python', 'coc-tsserver', 'coc-emmet', 'coc-html', 'coc-css', 'coc-json', 'coc-git', 'coc-phpls', 'coc-snippets']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
vmap <leader>gf  <Plug>(coc-format-selected)
noremap <leader>gs :CocSearch 

"Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
" packadd! vimspector
nmap <Leader>di <Plug>VimspectorBalloonEval


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 EXEC FILES                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Python run
autocmd FileType python map <buffer> <F2> :w<CR>:exec '! python' shellescape(@%, 1)<CR>

"C run
autocmd BufEnter *.c map <F2> :w <CR> :!gcc % -o %< && ./%< <CR>

" Node run
autocmd FileType javascript map <buffer> <F2> :w<CR>:exec '! node' shellescape(@%, 1)<CR>

" Markdown run
autocmd FileType markdown map <buffer> <F2> :w<CR>:InstantMarkdownPreview<CR>

" Jinja filetype
" au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

" @Deprecated Snippets
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>5jwf>a


" Netrw
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   TESTING                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



