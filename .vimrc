" To make sure all the good things for vim stay.
set nocompatible

" ----------------------   plugin setup -----------------------------
" Vundle.vim Plugin management https://github.com/VundleVim/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" ack.vim Use ag to search, this plugin enabled to use Ack search in Vim and show
" results in a separate split window
Plugin 'mileszs/ack.vim'
" vim-fugitive Git wrapper, enables to use GBlame, GDiff etc.
Plugin 'tpope/vim-fugitive'
" vim-easymotion Keyboard only movement, enables to use keys to move around
" easier
Plugin 'easymotion/vim-easymotion'
" Theme background
Plugin 'chriskempson/base16-vim'
" Theme background
Plugin 'dracula/vim'
" indentLine, Indent guide lines, show lines for indention
Plugin 'Yggdroot/indentLine'
" Lint for javascript
Plugin 'eslint/eslint'
" Syntac checker
Plugin 'scrooloose/syntastic'
" ctrlp.vim Full path fuzzy file, buffer, mru, tag finder for vim, enables to
" use ctrl + p to trigger
Plugin 'ctrlp.vim'
" vim-ember-hbs enables hbs ember handlebars syntac highlighting and indentation to vim
Plugin 'joukevandermaas/vim-ember-hbs'
" vim-airline lean & mean status/tabline for vim at the bottom
Plugin 'bling/vim-airline'
" Themes for vim-airline
Plugin 'vim-airline/vim-airline-themes'
" Highlight pig syntax
Plugin 'motus/pig.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ---------------------- plugin setup end -----------------------------
"
" ------------------------------- plugin config -------------------------------
" mileszs/ack.vim config
let g:ackhighlight = 1
if executable('ag')
  " Use ag (the silver searcher) if it's installed
  let g:ackprg = 'ag --vimgrep'
endif

" ctrlpvim/ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Respect .gitignore, only search files considered as part of git
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
" set filename search by default
" let g:ctrlp_by_filename = 1
" To support easymotion shortcut
let mapleader="\<Space>"

" Turn off indent line
let g:indentLine_enabled = 0

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
let g:syntastic_java_checkstyle_classpath = '/home/tizhang/.vim/tools/checkstyle-8.12-all.jar'
let g:syntastic_java_checkstyle_conf_file = '$PWD/ligradle/checkstyle/linkedin-checkstyle.xml'
" template lint config
let g:ale_linters = {'html': ['embertemplatelint']}
" ------------------------------- plugin config end-------------------------------

" ------------------------------- basic config -------------------------------
filetype plugin indent on    " required Allow smart indentation and filetype detection
set autoread " Auto re-read files that have changes outside of vim
set cursorline " highlight current line
" highlight syntax
syntax on
" Turn on line numbers
set number
" set hybrid line numbers
:set number relativenumber
" Gutter width
set numberwidth=5
" strip trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
" Change cursor shape between insert and normal mode in iTerm2.app
" skinny
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\" " Vertical bar in insert mode
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" " Block in normal mode
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
" Swap/Backup file settings
set noswapfile " no more weirdo swap files
set nobackup " no more weirdo backup files
set bg=dark " Dark background
set t_Co=256 " Enable pretty colors

" Indentation settings
set expandtab " Convert tabs to spaces
let g:indentation_depth = 2 " Number of spaces to indent
let &shiftwidth=g:indentation_depth " Set distance to move lines or blocks
let &tabstop=g:indentation_depth " Set tab character width
let &softtabstop=g:indentation_depth " Set space added by pressing tab key and removed by pressing backspace
let &backspace=g:indentation_depth " Make backspace work like a sane person would expect

set linebreak
set ignorecase " case-insensitive searching
set smartcase " make search case-sensitive if search term contains mixed case
set hlsearch " Highlight search pattern matches
set incsearch " Add live highlighting to matches while typing search term

" This enables vim clipboard sync with system clipboard. Not able to get it
" working yet so commented out for now.
" set clipboard=unnamedplus

" Config fzf
" set rtp+=~/.fzf
" Config nterw
" let g:netrw_keepdir=0

" Automatically switch relativenumber and absolute numbers based on normal
" mode or insert mode
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END


" ------------------------------- basic config end -------------------------------
