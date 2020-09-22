#!/bin/bash

. ../service-helper.sh

create_brew_service(){
     # brew-service.server.service
    service_remove brew-service.server
    create_and_run_service brew-service.server ../brew-installer/brew-service.server.service ../brew-installer/brew.service.sh
    service_status brew-service.server
    service_status_all
    # service_remove brew-service.server
    # service_status_all

    # sudo cp brew-service.service /etc/systemd/system/brew-service.service
}