#!/bin/bash

create_and_run_service() {
    local serviceName=$1
    local serviceFilePath=$2
    local serviceFileName=$serviceName.service
    local sysDir=/etc/systemd/system
    local systemPath="$sysDir/$serviceFileName"
    local curdir=$pwd
    # cp akarim-service.service /etc/systemd/system/akarim-service.service
    echo "Copying cp $serviceFilePath $systemPath ..."
    sudo cp $serviceFilePath $systemPath
    cd $sysDir
    echo "checking grep - [$sysDir] - ls -la | grep $serviceFileName"
    ls -la | grep "$serviceFileName"
    cd $curdir
    service_chmod $systemPath
    service_chmod $serviceFilePath
    service_start $serviceName
    service_status $serviceName
    service_enable $serviceName
    service_restart $serviceName
    service_status $serviceName
}

service_chmod() {
    local path=$1
    echo "$path - applying chmod 644 $path ..."
    sudo chmod 644 $path
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
    echo "$serviceFileName - service full restarting (stop, start, restart, status)..."
    service_start $serviceName
    service_stop $serviceName
    service_restart $serviceName
    service_status $serviceName
}

service_disable() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    echo "$serviceFileName - service disabling..."
    sudo systemctl disable $serviceFileName
}

service_remove() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    local systemPath="/etc/systemd/system/$serviceFileName"
    echo "$serviceFileName - service removing (disable, stop, remove)..."
    service_disable $serviceName
    service_stop $serviceName
    echo "running - sudo rm -rf $systemPath"
    sudo rm -rf $systemPath
}

service_full_restart() {
    local serviceName=$1
    echo "Service full restarting (stop, start, restart, status)..."
    service_start $serviceName
    service_stop $serviceName
    service_restart $serviceName
    service_status $serviceName
}

service_status_all() {
    sudo service --status-all
}
