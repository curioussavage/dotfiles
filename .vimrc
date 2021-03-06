"VIM compatibility
set nocompatible


"Remap F2 to NERDTreeToggle
map <silent> <F2> :NERDTreeToggle<CR>

syntax enable 

set nobackup

set hidden
set number 
set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set showmatch
set cul
set cursorcolumn
set scrolloff=10
set showcmd

set autoread
set ruler

set incsearch
set ignorecase
set smartcase
set visualbell 

set nowrap

" Path/File Expansion
set wildmode=list:longest
set wildmenu
set wildignore=*.o,*.obj,*~,node_modules

" Status Line
set ls=2

"set statusline=\ %t\ %y\ Line:\ %l/%L:%c
set statusline=%F%m%r%h%w\ [FF=%{&ff}]\ [T=%Y]\ [A=\%03.3b]\ [H=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

"Autocomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"Ctags
let Tlist_Ctags_Cmd='/opt/local/bin/ctags' 

au BufRead,BufNewFile *.scss set filetype=scss
au BufRead,BufNewFile *.*qn set filetype=fml
au BufNewFile,BufRead *.es6 set filetype=javascript


call pathogen#infect() 

"Awesome stuff
"map w!! to ignore read-only
cmap w!! $!sudo tee > /dev/null %

"exit insert mode after 15 seconds
au CursorHoldI * stopinsert
au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
au InsertLeave * let &updatetime=updaterestore

"awesome mappings
map H ^
map L $
nnoremap ; :

"Stupid f1 key"
map <F1> <Esc>
imap <F1> <Esc>

"Display extra whitespace
set list listchars=tab:»·,trail:·

set directory=~/.vim/vim-tmp,~/.tmp,~/tmp,~/var/tmp,/tmp

"let g:ackprg="ack-grep -H --nocolor --nogroup --column"
highlight CursorColumn ctermbg=Black

" Use Ag over Grep if available
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
endif

let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
  exe "set" git_settings
endif

let JSHintUpdateWriteOnly=1

colorscheme gotham
