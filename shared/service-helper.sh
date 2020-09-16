#!/bin/bash

create_and_run_service() {
    local serviceName=$1
    local serviceFilePath=$2
    local serviceFileName=$serviceName.service
    local systemPath="/etc/systemd/system/$serviceFileName"

    # cp akarim-service.service /etc/systemd/system/akarim-service.service
    echo "Copying cp $serviceFilePath $systemPath ..."
    sudo cp $serviceFilePath $systemPath
    echo "chmod 644 $systemPath ..."
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
    echo "$serviceFileName - service starting..."
    sudo systemctl start $serviceFileName
}

service_stop() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    echo "$serviceFileName - service stopping..."
    sudo systemctl stop $serviceFileName
}

service_status() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    echo "$serviceFileName - service status..."
    sudo systemctl status $serviceFileName
}

service_enable() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    echo "$serviceFileName - service enabled..."
    sudo systemctl enable $serviceFileName
}

service_restart() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    echo "$serviceFileName - service restarting..."
    sudo systemctl restart $serviceFileName
}

service_full_restart() {
    local serviceName=$1
    echo "Service full restarting (stop, start, restart, status)..."
    service_start $serviceName
    service_stop $serviceName
    service_restart $serviceName
    service_status $serviceName
}