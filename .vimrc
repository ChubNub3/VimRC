" VimRC 
" Name: Lake ghandour
" Date modified: 5-7-2022

highlight Normal ctermbg=Black
highlight NonText ctermbg=Black
filetype indent on
filetype plugin on
syntax on

"--Vim Presets--
set nu
set autoindent
set smartindent
set smarttab
set incsearch
set expandtab
set hlsearch
set ignorecase "Ignores capitilization from search
set lazyredraw  
set linebreak "doesnt make lines go across window
set scrolloff=1 
set sidescrolloff=5
set wrap
set cursorline
set title
set history=1000
set nomodeline
set laststatus=2
set backspace=indent,eol,start
set mouse=a
set noerrorbells 
set vb t_vb=
set noswapfile

" Make terminal open below file, terminal size 10x0
set splitbelow
set termwinsize=10x0

"---Plugins---
call plug#begin('~/.vim/plugged')

Plug 'ycm-core/youcompleteme' "Auto-completer!
Plug 'morhetz/gruvbox' "Colorscheme
Plug 'junegunn/fzf', {'do': { -> fzf#install() } } "fuzzy finder
Plug 'junegunn/fzf.vim' "fuzzy finder
Plug 'preservim/nerdtree' "File finder
Plug 'vim-airline/vim-airline' "aesthetic core uwu
Plug 'vim-airline/vim-airline-themes' "Aesthetic core uwu pt.2
Plug 'frazrepo/vim-rainbow' "Helps find brackets and stuff
Plug 'mbbill/undotree' "Shows all previous changes saved on tree
Plug 'chiel92/vim-autoformat' "Auto format
Plug 'uiiaoo/java-syntax.vim' "Better java Syntax highlighting
Plug 'mattn/emmet-vim' "Easier way to write html code
Plug 'tpope/vim-fugitive' "Git commands in Vim
Plug 'honza/vim-snippets' " Snippets !!
Plug 'SirVer/ultisnips' " Snippet engine  
call plug#end()

"--Colorscheme aesthetic stuff--
colorscheme gruvbox
set background=dark
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }



"----Basic Key Bindings----
let g:mapleader = "'"

inoremap jj <esc>
vnoremap jj <esc>

nnoremap <leader>w :wincmd w<CR>
nnoremap <leader>g <c-w>v <CR>
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>f :tabn<CR>
nnoremap <leader>t :term <CR>

"Disable/Enable auto-comment
nmap <leader>c :setlocal formatoptions-=cro<CR>
nmap <leader>C :setlocal formatoptions=cro<CR>

nnoremap <leader>a :NERDTreeToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>

" compile file in vim editor
nnoremap <c-j> :!javac % && java %:r  <CR>
nnoremap <c-p> <CR> :!clear;python3 % <CR>


"-- YCM and Snippet Configs--

nnoremap <leader>d :YcmCompleter GoToDefinition <CR>
function! s:CustomizeYcmQuickFixWindow()
  " Move the window to the top of the screen.
  wincmd K
  " Set the window height to 5.
  5wincmd _
endfunction
autocmd User YcmQuickFixOpened call s:CustomizeYcmQuickFixWindow()
inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<CR>"

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="s"

"Autoformat Keys
nnoremap <leader>F :Autoformat<CR>

"---- Java development ----

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
