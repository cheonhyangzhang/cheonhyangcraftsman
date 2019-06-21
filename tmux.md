# How to autocomplete session name when attach session
Attach session by name could be tedious, e.g.
```
$: tmux ls
taeyeon: 2 windows ...
yuri: 1 windows
$: tmux attach -dt taeyeon
```
when you type `tmux attach -dt`, there is no autocomplete when pressing tab.

## Create a new file for autocomplete
```
vim /etc/bash_completion.d/tma
```
The file should contain
```sh
_tma() {
    TMUX_SESSIONS=$(tmux ls -F '#S' | xargs)

    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$TMUX_SESSIONS" -- $cur) )
}
complete -F _tma tma
```
## Create a bash alias
In ~/.bashrc file, add
```
alias tma='tmux attach -t $1'
if [ -f /etc/bash_completion.d/tma ]; then
. /etc/bash_completion.d/tma
fi
```
source the bashrc file
```
source ~/.bashrc
```

## Enjoy the autocomplete of session name


