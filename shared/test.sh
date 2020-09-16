#!/bin/bash

# Include files.
. ./service-helper.sh

service_test(){
    # brew-service.server.service
    create_and_run_service brew-service.server ../brew-installer/brew-service.server.service
    service_status brew-service.server
    service_status_all
    service_remove brew-service.server
    service_status_all

    # sudo cp brew-service.service /etc/systemd/system/brew-service.service
}

service_test
