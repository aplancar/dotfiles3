source $VIMRUNTIME/defaults.vim

set laststatus=2
set noshowmode

let mapleader = ";"

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

let g:lightline = {
  \ 'colorscheme': 'one',
  \ }
let &background = "dark"

" Indicate VCS platforms to check
let g:signify_vcs_list = ['git']

highlight SignifySignAdd    ctermbg=233 ctermfg=2 cterm=bold
highlight SignifySignDelete ctermbg=233 ctermfg=1 cterm=bold
highlight SignifySignChange ctermbg=233 ctermfg=3 cterm=bold
highlight clear SignColumn

:nnoremap <leader>cfs :FZF<cr>

" Mark tabs and trailing whitespace
set list listchars=tab:≫\ ,trail:°

" Relative numbers
set rnu

" Ignore case when searching
set ignorecase
set smartcase

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Search
hi Search ctermfg=8 ctermbg=7

" Airline plugin
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='bubblegum'

let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }

" NERDTree
map <F5> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ :qa! | endif
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Floaterm
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

let $FZF_DEFAULT_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -50'"

" Seems to be required by rust. Confirm if this is the case
syntax enable

" Tab stuff
filetype plugin indent on
set softtabstop=2
set shiftwidth=2
set tabstop=2
set shiftround
set number
set expandtab

vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
" not sure I need this one...
"imap <C-v> <C-r><C-o>+
