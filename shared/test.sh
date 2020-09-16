#!/bin/bash

# Include files.
. ./service-helper.sh

create_and_run_service brew-service ../brew-installer/brew-service.service
service_status brew-service
# sudo cp brew-service.service /etc/systemd/system/brew-service.service