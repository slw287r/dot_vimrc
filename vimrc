silent! py3 pass
" clang options
let g:clang_c_options = '-std=gnu17'
let g:clang_cpp_options = '-std=c++17 -stdlib=libc++'
let g:clang_library_path="/Library/Developer/CommandLineTools/usr/lib"

syntax on
filetype on
filetype plugin on
filetype plugin indent on

"inoremap <Nul> <C-x><C-o>
autocmd FileType * set tabstop=4|set shiftwidth=4|set noexpandtab
autocmd BufEnter *.py set ai sw=4 ts=4 sta et fo=croql
au FileType python setlocal wrap expandtab shiftwidth=4 softtabstop=4 tabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

au InsertLeave *.c write
au InsertLeave *.h write
au InsertLeave *.py write
scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set t_vb=
set ambiwidth=double
set autochdir
set autoindent
set background=dark
set backspace=indent,eol,start
set completeopt=menuone,longest
set cursorline
set fileformats=unix
set foldcolumn=0
set foldenable
set foldmethod=indent
set foldmethod=syntax
set foldnestmax=3
set hidden
set hlsearch
set incsearch
set list
set listchars=tab:»\ ,eol:¬,nbsp:⎵,trail:⎵,extends:»,precedes:«,nbsp:¬
set magic
set matchtime=1
set nobackup
set nocompatible
set noerrorbells
set nofoldenable
set noic
set noswapfile
set novisualbell
set nowb
set number
set numberwidth=1
set ruler
set rulerformat=R%l,C%v
set scrolloff=3
set showcmd
set showmatch
set showmode
set smartindent
set splitbelow
set splitright
set statusline&
set cindent
set noexpandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set wildmenu
set wildmode=list:longest
set wrap
setlocal foldlevel=1

function! ResCur()
	if line("'\"") <= line("$")
		normal! g`"
		return 1
	endif
endfunction

augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END

filetype plugin indent on

" When editing a file, always jump to the last known cursor position.
" " Don't do it when the position is invalid or when inside an event handler
" " (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\	  exe "normal g`\"" |
\ endif

nnoremap <C-Tab> <C-w>w
nnoremap <C-S-Tab> <C-w>W
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" nnoremap <C-l> :set list!<CR>

inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

hi Cursor ctermfg=black ctermbg=white
hi CursorLine cterm=NONE ctermbg=234
hi NonText ctermfg=234 guifg=#282828
hi SpecialKey ctermfg=234 guifg=grey

hi Normal ctermbg=NONE ctermfg=250
hi Search cterm=NONE ctermfg=blue ctermbg=yellow
hi Pmenu cterm=NONE ctermfg=white ctermbg=58
hi PmenuSel cterm=NONE ctermfg=black ctermbg=172
hi LineNr ctermfg=240 ctermbg=234
hi LineNr font='Hasklig-ExtraLight'
hi CursorLineNr ctermfg=240 ctermbg=234

" Search
hi IncSearch                 cterm=NONE ctermfg=57 ctermbg=184
hi Search                    cterm=NONE ctermfg=57 ctermbg=184

"set cpoptions+=n
hi ColorColumn ctermbg=234
let &colorcolumn=join(range(81,999),",")
au BufRead *.py execute "setlocal colorcolumn=" . join(range(&textwidth,999), ',')

" Visual and selection
hi Visual                    cterm=NONE ctermfg=188 ctermbg=59

" Syntax group
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
hi Comment                   cterm=ITALIC ctermfg=240 ctermbg=NONE
hi Paren                     cterm=NONE ctermfg=145 ctermbg=NONE
hi MatchParen                cterm=UNDERLINE ctermfg=145 ctermbg=NONE
hi Comma                     cterm=NONE ctermfg=146 ctermbg=NONE
hi Constant                  cterm=NONE ctermfg=114 ctermbg=NONE
hi String                    cterm=NONE ctermfg=114 ctermbg=NONE
hi Statement                 cterm=NONE ctermfg=176 ctermbg=NONE
hi Error                     cterm=BOLD,UNDERLINE  ctermfg=203 ctermbg=NONE
hi Identifier                cterm=NONE ctermfg=63 ctermbg=NONE
hi Ignore                    cterm=NONE ctermfg=231 ctermbg=NONE
hi Number                    cterm=NONE ctermfg=173 ctermbg=NONE
hi PreProc                   cterm=NONE ctermfg=176 ctermbg=NONE
hi Special                   cterm=NONE ctermfg=73 ctermbg=NONE
hi Delimiter                 cterm=BOLD ctermfg=114 ctermbg=NONE
hi Todo                      cterm=NONE ctermfg=176 ctermbg=NONE
hi Type                      cterm=NONE ctermfg=176 ctermbg=NONE
hi Underlined                cterm=UNDERLINE ctermfg=63 ctermbg=NONE
hi Conditional               cterm=NONE ctermfg=176 ctermbg=NONE
hi Repeat                    cterm=NONE ctermfg=176 ctermbg=NONE
hi Operator                  cterm=NONE ctermfg=145 ctermbg=NONE
hi Keyword                   cterm=NONE ctermfg=176 ctermbg=NONE
hi Exception                 cterm=NONE ctermfg=69 ctermbg=NONE
hi Function                  cterm=NONE ctermfg=111 ctermbg=NONE

" Splits
set fillchars+=vert:\ 
hi StatusLine                cterm=ITALIC ctermbg=239 ctermfg=250
hi StatusLineNC              cterm=ITALIC ctermbg=237 ctermfg=250
hi VertSplit                 cterm=NONE ctermfg=NONE ctermbg=237

" Messages
hi ErrorMsg                  cterm=NONE ctermfg=196 ctermbg=NONE
hi WarningMsg                cterm=NONE ctermfg=52  ctermbg=NONE
hi WarningMsgildMenu         cterm=NONE ctermfg=NONE ctermbg=darkgrey
hi WildMenu                  cterm=UNDERLINE ctermfg=NONE ctermbg=darkgrey

" Tabs
hi TabLine              cterm=NONE ctermfg=17 ctermbg=145
hi TabLineFill          cterm=REVERSE
hi TabLineSel           cterm=BOLD

" Spelling
hi SpellBad                    cterm=undercurl guisp=Red
hi SpellCap                    cterm=undercurl guisp=Blue
hi SpellRare                   cterm=undercurl guisp=Magenta
hi SpellLocale                 cterm=undercurl guisp=DarkCyan

" Highlight tags
if has("autocmd")
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|NB\|INFO\|IDEA\)')
endif

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
