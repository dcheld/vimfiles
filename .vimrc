" Jump to a subject map for no-englesh keyboards
"
nnoremap <C-CR> o<Esc>k
nnoremap <C-S-CR> O<Esc>j

" Disable beep
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
" Based on @mislav post http://mislav.uniqpath.com/2011/12/vim-revisited/
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set display=truncate
set ruler
set mouse=v

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" My customizations
set ls=2                        " always show status bar
set number                      " show line numbers
set cursorline                  " display a marker on current line
colorscheme railscasts          " set colorscheme

set completeopt=menuone,longest,preview " simple autocomplete for anything
set wildmode=list:longest,full  " autocomplete for paths and files
set wildignore+=.git            " ignore these extensions on autocomplete

set hidden                      " change buffers without warnings even when there are unsaved changes

set backupdir=/tmp,$TEMP//,.    " directory used to save backup files
set directory=/tmp,$TEMP//,.    " directory used to save swap files

set nobackup
set nowritebackup

set t_Co=256                    " forces terminal to use 256 colors
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Source_Code_Pro_for_Powerline:h9:cANSI:qDRAFT
  endif
endif

map <F2> :NERDTreeToggle<CR>
nnoremap <space>l :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

set guioptions+=m  "add menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar

let vimlocal = expand("%:p:h") . "/.vimrc.local"
if filereadable(vimlocal)
  execute 'source '.vimlocal
endif

au GUIEnter * simalt ~x
nmap <F9> :mksession! <cr> " Quick write session with F9
nmap <F10> :source Session.vim <cr> " And load session with F10
set switchbuf+=usetab,newtab
set wrapscan
if has("win32")
  let g:slime_target = "tmux"
  map go <C-]>
endif
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#close_symbol = ''
let g:airline#extensions#tabline#buffer_nr_format = 'b%s: '
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline_theme='dark'

" remap split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" open splits in a more natural way:
set splitbelow
set splitright

set relativenumber
set diffopt=filler,vertical
au BufReadPost fugitive:* set bufhidden=delete

" highlight trailing white spaces:
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabClosePreviewOnPopupClose = 1
set completeopt=longest,menuone,preview
" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=300
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2
" Enable snippet completion, requires completeopt-=preview
" would need to instal ultisnips, which could conflict with other snippets plugins
"let g:OmniSharp_want_snippet=1


" Easymotion config:
" let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
"let g:EasyMotion_smartcase = 1
" JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

call plug#begin('~/vimfiles/plugged')
Plug 'scrooloose/nerdtree' " Filesystem explorer
Plug 'morhetz/gruvbox' " ColorScheme
Plug 'jistr/vim-nerdtree-tabs' " NERDtree and tabs together
Plug 'tpope/vim-fugitive' "Git wrapper
Plug 'vim-syntastic/syntastic' "Syntax checks"
Plug 'tpope/vim-commentary'
Plug 'PProvost/vim-ps1'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline' "Show statusline at bottom
Plug 'vim-airline/vim-airline-themes' "Themes for vim-airline
Plug 'tpope/vim-surround' "Surround.vim is all about 'surroundings': parentheses, brackets, quotes, XML tags, and more
Plug 'easymotion/vim-easymotion' " EasyMotion
Plug 'twinside/vim-haskellconceal'
call plug#end()

nnoremap <A-k> <Up>ddp<Up>
nnoremap <A-j> ddp
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
nnoremap <silent> <C-t> :tabnew<CR>

" Abreviations to prevent miss typings like
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Put, delete and yank without use registers
noremap <leader> <Nop>
noremap <leader>y "*y
noremap <leader>Y "+y
noremap <leader>p "*p
noremap <leader>P "+p
noremap <leader>d "_d
noremap <leader>D "_D
noremap <silent> <space>w :w<CR>
inoremap <c-v> <c-o>"+p
inoremap <c-z> <c-o>u

nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>  " Remove space in end of line
nnoremap <space>s _f,a<CR><Esc>==<leader>s " Break current line in multiple lines with separator ,
