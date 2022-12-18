# [:leftwards_arrow_with_hook:](../README.md) Interactive Git Checkout

- [:leftwards\_arrow\_with\_hook: Interactive Git Checkout](#leftwards_arrow_with_hook-interactive-git-checkout)
  - [Overview](#overview)
  - [Bash Implementations](#bash-implementations)
    - [Bash Interactive Git Checkout](#bash-interactive-git-checkout)
    - [Bash Interactive Git Checkout One-liner](#bash-interactive-git-checkout-one-liner)

## Overview
Repo for interactive git checkout/branch switching.
The solution must allow for at least basic branch filtering and displaying all available branches (at least local).

## Bash Implementations
 * MVP solution
 * Implemented in `bash`.
 * Useful for adding to `gitconfig`.

### Bash Interactive Git Checkout
```bash
selSym="Selected------>"
tmp=$(git branch --list)
tmp=($(echo "$tmp" | sed "s/\* \{1,\}/$selSym/g"))

if [[ ${#tmp[@]} -gt 1 ]] ; then 
    tmp2=()
    for branch in ${tmp[@]}; do
        if [[ $branch =~ ^$selSym ]]; then
            selected=${branch//$selSym/}
            echo "Current Branch: $selected"
        elif [[ ${branch^^} =~ ${1^^} ]]; then
                tmp2+=($branch)
        fi
    done
    echo "Select New Branch To Switch:"
    for i in ${!tmp2[@]}; do
        echo "  $i - ${tmp2[$i]}"
    done
    read -p "Index: " index
    if [[ $index -ge 0 && $index -lt ${#tmp2[@]} ]]; then
        git checkout ${tmp2[$index]}
    else
        echo "Invalid index: $index"
    fi
else 
    echo "No Local Branches To Select From"
fi
```

### Bash Interactive Git Checkout One-liner
```bash
f(){ selSym="Selected------>"; tmp=$(git branch --list); tmp=($(echo "$tmp" | sed "s/\* \{1,\}/$selSym/g")); if [[ ${#tmp[@]} -gt 1 ]] ; then tmp2=(); for branch in ${tmp[@]}; do if [[ $branch =~ ^$selSym ]]; then selected=${branch//$selSym/}; echo "Current Branch: $selected"; elif [[ ${branch^^} =~ ${1^^} ]]; then tmp2+=($branch); fi; done; echo "Select New Branch To Switch:"; for i in ${!tmp2[@]}; do echo "  $i - ${tmp2[$i]}"; done; read -p "Index: " index; if [[ $index -ge 0 && $index -lt ${#tmp2[@]} ]]; then git checkout ${tmp2[$index]}; else echo "Invalid index: $index"; fi; else echo "No Local Branches To Select From"; fi; }; f 
```