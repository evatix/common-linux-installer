#!/bin/bash

# Include files.
. ./shell-logger.sh
. ./users-helper.sh
. ./declare-bool.sh
. ./strings-helper.sh

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

download_install_targz(){
    local wgetUrl=$1
    local downloadFileName=$2
    local downloadTemp=$(get_downloads_temp_directory)
    local fileNameWithoutExtension=string_search_and_remove $downloadFileName ".tar.gz"
    download_files_to_logged_users_download_temp_if_not_exists $wgetUrl $downloadFileName
    cd $downloadTemp
    pwd
    # https://askubuntu.com/questions/25961/how-do-i-install-a-tar-gz-or-tar-bz2-file
    echo "$downloadFileName : $fileNameWithoutExtension"
    
    tar xzf "$downloadFileName"
    ls -la
    cd $fileNameWithoutExtension
    cd ./configure
    pwd
    # sudo make install
}

force_copy(){
    local from=$1
    local to=$2
    info "Copying : yes | cp -rf $from $to"
    yes | cp -rf $from $to
}

sudo_force_copy(){
    local from=$1
    local to=$2
    info "Copying : yes | sudo cp -rf $from $to"
    yes | sudo cp -rf $from $to
}

move_to_directory_ls_with_grep(){
    local moving=$1
    local grepCommand=$2
    local curdir=$pwd
    info "---- [Start] Appying grep - cd [$moving] && ls -la | grep $grepCommand ----"
    info "Current: $curdir"
    info "Moving to : $moving"
    cd $moving
    local curdir2=$pwd
    info "Running Grep ($curdir2): ls -la | grep $grepCommand"
    ls -la | grep "$grepCommand"
    cd $curdir
    local curdir3=$pwd
    info "Current Directory : $curdir3"
    info "----- [End] -----"
}