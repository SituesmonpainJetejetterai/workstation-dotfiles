# Listing the shortcuts and tips I learn from using `tmux`

A collection of `tmux` tutorials: [Awesome Tmux](https://github.com/rothgar/awesome-tmux)

## Copying and pasting text

This is big, because I often need to copy and paste between websites and vim.

```
<prefix-key> + [
<space>
<CR>
<prefix-key> + ]
```

Explanation\
The first commands puts `tmux` in copy mode.\
Then, we need to navigate to the text we want to copy (this is easy for me as `tmux` is set to use `vim` bindings).\
When we reach the text, press `<space>` to begin selection (akin to `v` in vim).\
After selecting the text (by navigating with keys, `h`, `j`, `k` and `l` for me), press <CR> to copy it to the clipboard.\
Finally, go to a new file (or wherever), and paste with `<prefix-key> + ]`.

## The status bar

To check the options set for the status bar,\
`tmux show-options -g | grep status`

It seems that the best way to customise it would be to write separate scripts (which is honestly, a better idea). This is akin to most window managers, and keeping things separate makes them simple.

Here are a few resources to do just that, for when I have a system on which I can actually test this:
- [Make Your Tmux Status Bar 100% Better With Bash](https://dev.to/brandonwallace/make-your-tmux-status-bar-100-better-with-bash-2fne)

# List all the key bindings in `tmux`

`tmux list-keys`
