set nocompatible              " required
filetype on                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Use ag to search
Plugin 'mileszs/ack.vim'
" Git wrapper
Plugin 'tpope/vim-fugitive'
" Keyboard only movement
Plugin 'easymotion/vim-easymotion'
" Theme background
Plugin 'chriskempson/base16-vim'
" Theme background
Plugin 'dracula/vim'
" Indent guide lines
Plugin 'Yggdroot/indentLine'
" Lint for javascript
Plugin 'eslint/eslint'
" Syntac checker
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set autoread " Auto re-read files that have changes outside of vim
set cursorline " highlight current line
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" mileszs/ack.vim
let g:ackhighlight = 1
if executable('ag')
  " Use ag (the silver searcher) if it's installed
  let g:ackprg = 'ag --vimgrep'
endif

" ctrlpvim/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Respect .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" highlight syntax
syntax on
" Turn on line numbers
set number
" Gutter width
set numberwidth=5

" strip trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Make cursor skinny on insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Swap/Backup file settings
set noswapfile " no more weirdo swap files
set nobackup " no more weirdo backup files

set bg=dark " Dark background
set nowrap " Disable line auto wrapping
set t_Co=256 " Enable pretty colors
filetype plugin indent on " Allow smart indentation and filetype detection
let mapleader="\<Space>" " To support easymotion shortcut

" Indentation settings
set expandtab " Convert tabs to spaces
let g:indentation_depth = 2 " Number of spaces to indent
let &shiftwidth=g:indentation_depth " Set distance to move lines or blocks
let &tabstop=g:indentation_depth " Set tab character width
let &softtabstop=g:indentation_depth " Set space added by pressing tab key and removed by pressing backspace
let &backspace=g:indentation_depth " Make backspace work like a sane person would expect

" scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" scrooloose/syntastic settings
let g:syntastic_scss_checkers = ['stylelint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '错'
let g:syntastic_style_error_symbol = '坏'
let g:syntastic_style_warning_symbol = '丑'
let g:syntastic_warning_symbol = '险'
" javascript config
let g:syntastic_javascript_eslint_exec = '$PWD/node_modules/.bin/eslint'
let g:syntastic_scss_eslint_exec = '$PWD/node_modules/.bin/stylelint'
let g:syntastic_sass_eslint_exec = '$PWD/node_modules/.bin/stylelint'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_perl_checker = 1
" java config
let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_java_checkstyle_classpath = '/Users/tizhang/.vim/tools/checkstyle-8.12-all.jar'
let g:syntastic_java_checkstyle_conf_file = '$PWD/ligradle/checkstyle/linkedin-checkstyle.xml'

set ignorecase " case-insensitive searching
set smartcase " make search case-sensitive if search term contains mixed case
set hlsearch " Highlight search pattern matches
set incsearch " Add live highlighting to matches while typing search term

set clipboard=unnamed
