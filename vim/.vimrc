" To make sure all the good things for vim stay.
set nocompatible

" -- basic start --------------------------
" highlight syntax
syntax on
" turn on line numbers
set number
" gutter on the left width
set numberwidth=5
" strip trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
" Change cursor shape between insert and normal mode in iTerm2.app skinny
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
" Indentation settings
set expandtab " Convert tabs to spaces
let g:indentation_depth = 2 " Number of spaces to indent
let &shiftwidth=g:indentation_depth " Set distance to move lines or blocks
let &tabstop=g:indentation_depth " Set tab character width
let &softtabstop=g:indentation_depth " Set space added by pressing tab key and removed by pressing backspace
let &backspace=g:indentation_depth " Make backspace work like a sane person would expect
" make wrap looks great
set wrap nolist linebreak
" case-insensitive searching and also make search case-sensitive if search term contains mixed case
set ignorecase smartcase
" Highlight search pattern matches
set hlsearch
" Add live highlighting to matches while typing search term
set incsearch
" Config popup window color
highlight Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
highlight PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE
" auto indent on new lines
set autoindent
" set a ruler at the 120 character count
set colorcolumn=120
highlight ColorColumn ctermbg=15 guibg=white
" display statusline always
set laststatus=2
" -- basic end --------------------------

" -- shortcut start --------------------------
" Use ctrl+p to trigger Rg
nnoremap <silent> <C-p> :Rg<cr>
" Use ctrl+c key to trigger search for current word
nnoremap <silent> <C-c> :Rg <C-R><C-W><CR>
" Use ctrl+g key to find git files
nnoremap <silent> <C-g> :GFiles<cr>
" Use ctrl+m key to find git files
nnoremap <silent> <C-m> :CocList<cr>commands<cr>
" Use ctrl+e key to find git files
nnoremap <silent> <C-e> :Explore<cr>
" Use ctrl+h key to see history
nnoremap <silent> <C-y> :History<cr>
" Use ctrl+r key to replace the current word in visual mode
vnoremap <C-r> "hy:%s/<c-r>=expand("<cword>")<cr>//g<left><left>
" allow gx to be used to open the current url word in the default browser
" seems like a conflict with netrw
nmap <silent> gx :!open <cWORD><cr>
" -- shortcut end --------------------------

" -- plugin setup -----------------------------
" Vundle.vim Plugin management https://github.com/VundleVim/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" fzf to search files and variables
Plugin 'junegunn/fzf.vim'
" vim-fugitive Git wrapper, enables to use Git status, Git diff, Git blame GBlame, GDiff etc
Plugin 'tpope/vim-fugitive'
" vim-easymotion Keyboard only movement, enables to use keys to move around easier
Plugin 'easymotion/vim-easymotion'
" Syntac checker
Plugin 'scrooloose/syntastic'
" vim-ember-hbs enables hbs ember handlebars syntac highlighting and indentation to vim
Plugin 'joukevandermaas/vim-ember-hbs'
" Lint for javascript
Plugin 'eslint/eslint'
" All of your Plugins must be added before the following line
call vundle#end()            " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ---------------------- plugin setup end -----------------------------

" -- plugin config start -------------------------------
" fzf Empty value to disable preview window altogether
let g:fzf_preview_window = 'up:50%'
" To support easymotion shortcut
let mapleader="\<Space>"
" scrooloose/syntastic settings
" turn on debug info
" let g:syntastic_debug = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
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
" let g:syntastic_java_checkstyle_classpath = '/home/tizhang/.vim/tools/checkstyle-8.36-all.jar'
" voyager-api checkstyle
let g:syntastic_java_checkstyle_classpath = '/home/tizhang/mps/voyager-api/build/checkstyle/libs/voyager-api-checks.jar'
let g:syntastic_java_checkstyle_conf_file = '$PWD/ligradle/checkstyle/linkedin-checkstyle.xml'
let g:syntastic_java_checkstyle_args = "-Dconfig_loc=$PWD/ligradle/checkstyle"
" template lint config
let g:ale_linters = {'html': ['embertemplatelint']}
" -- plugin config end -------------------------------

" -- coc config start ------------------
"  GRADLE_HOME=$HOME/.gradle/ligradle/gradle-4.8 vim if GRALDE_HOME is not
"  correct
"  Installation
"
"  mkdir -p ~/.vim/pack/coc/start
"  cd ~/.vim/pack/coc/start
"  curl --fail -L
"  https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
" if hidden is not set, TextEdit might fail.
" This enables to open a new file without having to save the current edited
" files. This is going to be helpful when checking definition of a class or
" method.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" use paste ode
" set paste

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)
" Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)
" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Using CocList
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" -- coc config end ------------------
