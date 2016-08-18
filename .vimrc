"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"   Sean Callan
"   sean@seancallan.com
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable line numbers
set number

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
" Save and quit
nmap <leader>x :x<cr>
" Fast quit
nmap <leader>q :q!<cr>

" Turn backup off
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme birds-of-paradise 
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=T
	set guioptions+=e
	set t_Co=256
	set guitablabel=%M\ %t

  if has("gui_macvim")
    set macligatures
    set guifont=Fira\ Code\ Retina:h13
  endif
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

set colorcolumn=120

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !1 | finish | endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/sean/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/sean/.vim/bundles')
  call dein#begin('/Users/sean/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/sean/.vim/bundles/repos/github.com/Shougo/dein.vim')

  call dein#add('Valloric/YouCompleteMe')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('docker/docker', { 'rtp': '/contrib/syntax/vim/' })
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('godlygeek/tabular')
  call dein#add('kien/ctrlp.vim')
  call dein#add('pangloss/vim-javascript')
  call dein#add('rking/ag.vim')
  call dein#add('scrooloose/syntastic')
  call dein#add('sjl/gundo.vim')
  call dein#add('slashmili/alchemist.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rails')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('whatyouhide/vim-gotham')
  call dein#add('felixhummel/setcolors.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

let g:airline_powerline_fonts = 1

" Toggle Gundo
nnoremap <leader>u :GundoToggle<CR>

" Open ag.vim
nnoremap <leader>a :Ag

" CtrlP configuration
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --ignore .git _build deps releases -g ""'

" ConqueShell config
let g:ConqueTerm_CloseOnEnd = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable folding
set foldenable

" Open folds at or above this level by default
set foldlevelstart=10

" Nested fold max
set foldnestmax=10

" Fold based on indentation
set foldmethod=indent

" Let space fold
nnoremap <space> za

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs and indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap

""""""""""""""""""""""""""""""
" Search + Visual mode
""""""""""""""""""""""""""""""
" When in Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	 \ if line("'\"") > 0 && line("'\"") <= line("$") |
	 \   exe "normal! g`\"" |
	 \ endif
" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""
" Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

nnoremap <silent> <Leader>c :call DeleteTrailingWS()<CR>
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.java :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.json :call DeleteTrailingWS()
autocmd BufWrite *.md :call DeleteTrailingWS()
autocmd BufWrite *.php :call DeleteTrailingWS()
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufWrite *.ex :call DeleteTrailingWS()
autocmd BufWrite *.exs :call DeleteTrailingWS()
autocmd BufWrite *.yml :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helpers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
	exe "menu Foo.Bar :" . a:str
	emenu Foo.Bar
	unmenu Foo
endfunction

function! VisualSelection(direction) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'b'
		execute "normal ?" . l:pattern . "^M"
	elseif a:direction == 'gv'
		call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
	elseif a:direction == 'replace'
		call CmdLine("%s" . '/'. l:pattern . '/')
	elseif a:direction == 'f'
		execute "normal /" . l:pattern . "^M"
	endif

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	en
	return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
	 buffer #
   else
	 bnext
   endif

   if bufnr("%") == l:currentBufNum
	 new
   endif

   if buflisted(l:currentBufNum)
	 execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! TabCompletion()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

:inoremap <Tab> <C-R>=TabCompletion()<CR>
:set dictionary="/usr/local/bin/dict"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autogroups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup configgroup
    autocmd!
    autocmd CursorMovedI * call TabCompletion()
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.json setlocal filetype=json
    autocmd BufEnter *.kt setlocal filetype=kotlin
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd FileType coffee setlocal shiftwidth=2
    autocmd FileType coffee setlocal softtabstop=2
    autocmd FileType coffee setlocal tabstop=2
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal noexpandtab
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal tabstop=2
    autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
