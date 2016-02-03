" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287

" set folding settings
" set foldmethod=indent   "fold based on indent
" set foldnestmax=10      "deepest fold is 10 levels
" set nofoldenable        "dont fold by default
" set foldlevel=1         "this is just what i use

set pastetoggle=<F2>

" clipboard
set clipboard=unnamed

execute pathogen#infect()
syntax on
filetype plugin indent on

set t_Co=256
colorscheme monokai

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Tab completion
" " will insert tab at beginning of line,
" " will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

if executable('ag')
   " Use Ag over Grep
   set grepprg=ag\ --nogroup\ --nocolor

   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
   let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

   " ag is fast enough that CtrlP doesn't need to cache
   let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Use smartcase
set ignorecase
set smartcase

" Set Explortrt default view to NERDTree style
let g:netrw_liststyle=3
" And map shortcut
map <leader>k :Explore<cr>

" pee aytch pee standards
let g:syntastic_php_checkers = ['php', 'phpcs']

" allow easytags to update in the background on save
let g:easytags_async = 1
