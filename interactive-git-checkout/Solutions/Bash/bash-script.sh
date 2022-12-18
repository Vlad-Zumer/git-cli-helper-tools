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
    echo "No Local Branches To Select From"; 
fi