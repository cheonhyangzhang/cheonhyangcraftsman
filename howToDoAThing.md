# How to do a thing as a developer
## How to search command you have run in bash
ctrl + r would give you a default search for command history but it is not very convenient.
Put the following lines to your `~/.bash_profile` file would help you have a much nicer command history search.
```
# Use fzf search for ctrl + r for command history
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
```
## Placeholder for new item
