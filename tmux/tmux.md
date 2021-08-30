# Listing the shortcuts and tips I learn from using `tmux`

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
When we reach the text, press <space> to begin selection (akin to `v` in vim).\
After selecting the text (by navigating with keys, `h`, `j`, `k` and `l` for me), press <CR> to copy it to the clipboard.\
Finally, go to a new file (or wherever), and paste with `<prefix-key> + ]`.

Not bad. Will take a little getting used to, but that's alright.
