#!/bin/bash

# Include files.
. ./brew-service-helper.sh
. ./file-helper.sh

service_test(){
    create_brew_service 
}

file_helper_test(){
    # download_files_to_logged_users_download_temp_if_not_exists "https://www.kernel.org/pub/software/scm/git/git-2.28.0.tar.gz" git.2.28.tar.gz
    download_install_targz "https://www.kernel.org/pub/software/scm/git/git-2.28.0.tar.gz" git.2.28.tar.gz
    # https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/
}

service_test
