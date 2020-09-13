# How to do a thing in vim
## How to search current word in the repo
To search a word in the current repo, I am using :Rg command, this is available by using fzf.vim plugin togehter with
ripgrep rg.
Map a key to the command in `~/.vimrc`
```
" Use ctrl+c key to trigger search for current word
nnoremap <silent> <C-c> :Rg <C-R><C-W><CR>
```
