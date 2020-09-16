#!/bin/bash

# Include files.
. ./service-helper.sh

service_test(){
    # brew-service.server.service
    service_remove brew-service.server
    create_and_run_service brew-service.server ../brew-installer/brew-service.server.service
    service_status brew-service.server
    service_status_all
    # service_remove brew-service.server
    # service_status_all

    # sudo cp brew-service.service /etc/systemd/system/brew-service.service
}

file_helper_test(){
    # download_files_to_logged_users_download_temp_if_not_exists "https://www.kernel.org/pub/software/scm/git/git-2.28.0.tar.gz" git.2.28.tar.gz
    download_install_targz "https://www.kernel.org/pub/software/scm/git/git-2.28.0.tar.gz" git.2.28.tar.gz
    # https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/
}

service_test
