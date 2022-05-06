" VimRC 
" Name: Lake ghandour
" Date modified: 5-5-2022

highlight Normal ctermbg=Black
highlight NonText ctermbg=Black
syntax on
filetype indent on
filetype plugin on

"--Vim Presets--
set nu
set autoindent
set smartindent
set smarttab
set tabstop=4
set noswapfile
set noerrorbells
set incsearch
set expandtab
set hlsearch
set ignorecase
set lazyredraw
set linebreak
set scrolloff=1
set sidescrolloff=5
set wrap
set cursorline
set title
set history=1000
set nomodeline
set laststatus=2
set mouse=a
set backspace=indent,eol,start

"---Plugins---
call plug#begin('~/.vim/plugged')
Plug 'ycm-core/youcompleteme'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'frazrepo/vim-rainbow'
Plug 'mbbill/undotree'
Plug 'chiel92/vim-autoformat'
Plug 'uiiaoo/java-syntax.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
call plug#end()

"--Colorscheme aesthetic stuff--
colorscheme gruvbox
set background=dark
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

"----Basic Key Bindings----
let g:mapleader = "'"
nnoremap <leader>w :wincmd w<CR>
nnoremap <leader>g <c-w>v <CR>

nnoremap <leader>n :tabnew<CR>
nnoremap <leader>f :tabn<CR>
nnoremap <leader>t :term <CR>

inoremap jj <esc>
vnoremap jj <esc>

nnoremap <leader>a :NERDTreeToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>

"Disable/Enable auto-comment
nmap <leader>c :setlocal formatoptions-=cro<CR>
nmap <leader>C :setlocal formatoptions=cro<CR>

" compile file in vim editor
nnoremap <c-j> :!javac % && java %:r  <CR>
nnoremap <c-p> <CR> :!clear;python3 % <CR>

"-- YCM Configs--
nnoremap <leader>d :YcmCompleter GoToDefinition <CR>
function! s:CustomizeYcmQuickFixWindow()
  " Move the window to the top of the screen.
  wincmd K
  " Set the window height to 5.
  5wincmd _
endfunction
autocmd User YcmQuickFixOpened call s:CustomizeYcmQuickFixWindow()
inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<CR>"

" Make terminal open below file, terminal size 10x0
set splitbelow
set termwinsize=10x0

"---- Java development ----

au BufNewFile,BufRead *.java
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
let g:syntastic_java_checkers = []
let NERDTreeIgnore=['\.class$', '\~$'] "ignore .class files in NERDTree

" Creates basic template for java files
autocmd BufNewFile *.java 0r ~/.vim/templates/java.skel

"---Python Dev----
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufRead,BufNewFile *.py,*.pyw  match BadWhitespace /\s\+$/    
let g:ycm_autoclose_preview_window_after_completion=1
let python_highlight_all=1

"---Web Dev---
autocmd BufNewFile *.html 0r ~/.vim/templates/html.skel

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-E>'
