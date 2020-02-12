Get started with tmux

# How to install tmux
## On RedHat/CentOS
```
sudo yum install tmux
```
run `tmux -V` to verify if succesfully installed

# Basic commands to use
## Remember the prefix key
In tmux, everything starts with the prefix key, which is ctrl + b by default.
Personally, I would highly recommended to change to other choise since ctrl + b requires pinky and index finger of the left hand to press.
I am using ctrl + j but this really comes to personal preferences.
## Before entering tmux
### Create a tmux session
```
tmux
```
### Create a tmux session with name and attach
```
tmux new -s <session_name>
```
### List existing sessions
```
tmux ls
```
### Attach to a session
```
tmux attach -t <session_name>
```
### Kill a session
```
tmux kill-session -t foo
```
## Inside of tmux
### detach a session
prefix then d
### Create a new window
prefix then c
### Switch to next window
prefix then n
### Switch to previous window
prefix then p
### Renumber the current window
prefix then .
### Move the current window to another session
prefix then . <session_name>
### Choose window interactively
prefix then w
### Rename window
prefix then ,
### join window 1 to current window
prefix then :join-pane -s 1
### join region 0 of window 1 to current window
:join-pane -s 1.0

### split into left and right panes
prefix then %
### split into top and bottom panes
prefix then "
### break current pane into separate window
prefix then !
### rotate panes
prefix then ctrl + o
### kill the current pane
prefix then x

### enter copy mode
prefix then [
### paste most recent buffer
prefix then ]
### choose buffer to paste interactively
prefix then =

In copy mode, vim style
### set mark
SPACE
### search backwards
?
### search forward
/
### exit copy mode
ESC

# How to customized your tmux
Check the tpm plugin
https://github.com/tmux-plugins/tpm
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
In case you don't have git, run `sudo yum install git` to install git in RedHat/CentOS.

Create ~/.tmux.conf file
```
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run -b '~/.tmux/plugins/tpm/tpm'
```
Then type this in terminal if tmux is already running
```
tmux source ~/.tmux.conf
```

After you added a plugin, don't forget to install the plugins. This could be done by
prefix then I (capital i)

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


