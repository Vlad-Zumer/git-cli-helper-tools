# [:leftwards_arrow_with_hook:](../README.md) Basic Aliases

Useful aliases to have.

```config
[alias]
    co = checkout
    st = status
    sub-up = submodule update --init --recursive
    update-repo = ! git fetch --prune && git pull && git sub-up
    new-branch = checkout -b
    aliases = ! git config --global --get-regexp ^alias\\. | sed -e s/^alias\\.// -e s/\\ /\\ =\\ / | sed -e s/$/\\\\n/
    aliases-all = ! git config --get-regexp ^alias\\. | sed -e s/^alias\\.// -e s/\\ /\\ =\\ / | sed -e s/$/\\\\n/

    # Needs Git >= 2.22 
    pusho-new = push --set-upstream origin $(git branch --show-current)
```