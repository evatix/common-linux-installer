# Reference: https://bit.ly/3gKycew
string_replace(){
    local stringGiven=$1
    local stringSearch=$2
    local stringReplace=$3
    echo ${stringGiven/$stringSearch/$stringReplace}
    #result=$(echo "$stringGiven" | sed "s/$stringSearch/$stringReplace/")
    #echo result
}

# string_replace "hello World this is mine" "world" "alim"

string_search_and_remove(){
    string_replace $1 $2 ""
}