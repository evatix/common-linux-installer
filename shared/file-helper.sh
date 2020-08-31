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
        echo "[$temp] : directory exists."
    else
        echo "[$temp] : directory not exist."
        echo "[$temp] : creating..."
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
    create_and_get_directory $temp
    echo $temp
}

download_files_to_logged_users_download_temp(){
    local wgetUrl=$1
    local downloadFileName=$2
    local tempDir=$(create_and_get_downloads_temp_directory)
    local fullDownloadPath="$temp/$downloadFileName"
    echo "[$tempDir] : downloads temp directory."
    cd "$tempDir"
    pwd
    
    if [ -f "$fullDownloadPath" ]; then
        echo "[$fullDownloadPath] : file already exist."
    else
        echo "wget -O $downloadFileName $wgetUrl"
        // wget -P $temp -O $downloadFileName $wgetUrl
    fi

    ls -la
}

download_files_to_logged_users_download_temp "https://www.kernel.org/pub/software/scm/git/git-2.28.0.tar.gz" git.2.28.tar.gz