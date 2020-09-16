#!/bin/bash

# Include files.
. ./service-helper.sh

# brew-service.server.service
create_and_run_service brew-service.server ../brew-installer/brew-service.server.service
service_status brew-service.server
# sudo cp brew-service.service /etc/systemd/system/brew-service.service