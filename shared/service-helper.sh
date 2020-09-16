#!/bin/bash

create_and_run_service() {
    local serviceName=$1
    local serviceFilePath=$2
    local serviceFileName=$serviceName.service
    local systemPath="/etc/systemd/system/$serviceFileName"

    sudo cp $serviceFileName $systemPath
    sudo chmod 644 $systemPath
    service_start $serviceName
    service_status $serviceName
    service_enable $serviceName
    service_restart $serviceName
    service_status $serviceName
}

service_start() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    sudo systemctl start $serviceFileName
}

service_status() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    sudo systemctl start $serviceFileName
}

service_enable() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    sudo systemctl enable $serviceFileName
}

service_restart() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    sudo systemctl restart $serviceFileName
}

service_restart() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    sudo systemctl restart $serviceFileName
}