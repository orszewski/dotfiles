set path+=**
set wildmenu

set t_Co=256
set background=light
colorscheme Tomorrow

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set nocompatible              " be iMproved, required
filetype plugin indent on    " required
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set autoindent
set cursorline
hi CursorLine  cterm=NONE ctermbg=17 ctermfg=NONE "white

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).

autocmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=4
set ts=4
set shiftwidth=4
set shiftround
set expandtab

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Display extra whitespace
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1

" Numbers
set number
set relativenumber
set numberwidth=5
syntax on

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
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

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

let g:airline_powerline_fonts = 1
execute pathogen#infect()

