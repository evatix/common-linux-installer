#!/bin/bash

# Include files.
. ./shell-logger.sh
. ./users-helper.sh
. ./declare-bool.sh

get_current_user_downloads() {
    local user=$(get_logged_in_users)
    echo "/home/$user/Downloads"
}

get_current_user_desktop() {
    local user=$(get_logged_in_users)
    echo "/home/$user/Desktop"
}

get_downloads_temp_directory() {
    local user=$(get_logged_in_users)
    echo "/home/$user/Downloads/temp"
}

is_file_exist(){
    local file=$1
    if [[ -f "$file" ]]; then
        return $TRUE
    fi

    return $FALSE
}

if_not_file_exist(){
    local file=$1
    if [[ -f "$file" ]]; then
        return $FALSE
    fi

    return $TRUE
}

if_not_directory_exist(){
    local directory=$1
    if [ -d "$directory" ]; then
        return $FALSE
    fi

    return $TRUE
}

create_directory_if_not_exists() {
    local temp=$1
    if [ -d  $temp ]; then
        #info "[$temp] : directory exists."
        return
    else
        #echo "[$temp] : directory not exist."
        #echo "[$temp] : creating..."
        mkdir $temp
    fi
}

create_downloads_temp_directory_if_not_exists() {
    local temp=$(get_downloads_temp_directory)
    create_directory_if_not_exists $temp
}

create_and_get_directory(){
    local dir="$1"
    create_directory_if_not_exists $dir
    echo $dir
}

create_and_get_downloads_temp_directory(){
    local temp=$(get_downloads_temp_directory)
    echo $(create_and_get_directory $temp)
}


get_combined_path_with_download_temp(){
    local temp=$(get_downloads_temp_directory)/$1
    echo $temp
}

download_files_to_logged_users_download_temp_if_not_exists(){
    local wgetUrl=$1
    local downloadFileName=$2
    local tempDir=$(create_and_get_downloads_temp_directory)
    local fullDownloadPath="$tempDir/$downloadFileName"
    # echo "[$tempDir] : downloads temp directory [$fullDownloadPath]."
    cd "$tempDir"
    # pwd
    
    if [ -f "$fullDownloadPath" ]; then
        # echo "[$fullDownloadPath] : file already exist."
        return
    else
        # echo "wget -P $tempDir -O $downloadFileName $wgetUrl"
        wget -P $tempDir -O $downloadFileName $wgetUrl
    fi

    ls -la
}

# Reference: https://bit.ly/3gKycew
string_replace(){
    local stringGiven=$1
    local stringSearch=$2
    local stringReplace=$3
    echo ${stringGiven/$stringSearch/$stringReplace}
    #result=$(echo "$stringGiven" | sed "s/$stringSearch/$stringReplace/")
    #echo result
}

download_install_targz(){
    local wgetUrl=$1
    local downloadFileName=$2
    local downloadTemp=$(get_downloads_temp_directory)
    download_files_to_logged_users_download_temp_if_not_exists $wgetUrl $downloadFileName
    cd $downloadTemp
    pwd
    # https://askubuntu.com/questions/25961/how-do-i-install-a-tar-gz-or-tar-bz2-file
    echo "$downloadFileName"
    tar xzf "$downloadFileName"
    ls -la
    # cd ./configure
    # sudo make install
}

# download_files_to_logged_users_download_temp_if_not_exists "https://www.kernel.org/pub/software/scm/git/git-2.28.0.tar.gz" git.2.28.tar.gz
# download_install_targz "https://www.kernel.org/pub/software/scm/git/git-2.28.0.tar.gz" git.2.28.tar.gz


# https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/

string_replace "hello World this is mine" "world" "alim"