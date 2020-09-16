#!/bin/bash

. ./file-helper.sh

create_and_run_service() {
    local serviceName=$1
    local serviceFilePath=$2
    local batchFilePath=$3
    local serviceFileName=$serviceName.service
    local sysDir=/etc/systemd/system
    local sysBinPath=/usr/bin
    local sysBinServicePath=$sysBinPath/$serviceFileName
    local systemPath="$sysDir/$serviceFileName"
    # cp akarim-service.service /etc/systemd/system/akarim-service.service
    service_chmod_644 $serviceFilePath
    sudo_force_copy $serviceFilePath $systemPath
    sudo_force_copy $batchFilePath $sysBinServicePath
    service_chmod_plus_x $sysBinPath
    move_to_directory_ls_with_grep $sysBinPath $serviceName
    move_to_directory_ls_with_grep $sysDir $serviceName
    service_chmod_644 $systemPath
    service_start $serviceName
    service_enable $serviceName
    service_status $serviceName
}

service_chmod_644() {
    local path=$1
    warn "$path - applying chmod 644 $path ..."
    sudo chmod 644 $path
}

service_chmod_plus_x() {
    local path=$1
    warn "$path - applying chmod +x $path ..."
    sudo chmod +x $path
}

service_start() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    info "$serviceFileName - service starting..."
    sudo systemctl start $serviceFileName
}

service_stop() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    warn "$serviceFileName - service stopping..."
    sudo systemctl stop $serviceFileName
}

service_status() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    info "$serviceFileName - service status..."
    sudo systemctl status $serviceFileName
}

service_enable() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    warn "$serviceFileName - service enabling..."
    sudo systemctl enable $serviceFileName
}

service_restart() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    warn "$serviceFileName - service restarting..."
    sudo systemctl restart $serviceFileName
}

service_full_restart() {
    local serviceName=$1
    info "$serviceFileName - service full restarting (stop, start, restart, status)..."
    service_start $serviceName
    service_stop $serviceName
    service_restart $serviceName
    service_status $serviceName
}

service_disable() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    info "$serviceFileName - service disabling..."
    sudo systemctl disable $serviceFileName
}

service_remove() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    local sysDir=/etc/systemd/system
    local systemPath="$sysDir/$serviceFileName"
    info "$serviceFileName - service removing (disable, stop, remove)..."
    service_disable $serviceName
    service_stop $serviceName
    move_to_directory_ls_with_grep $sysDir $serviceName
    info "running - sudo rm -rf $systemPath"
    sudo rm -rf $systemPath
    move_to_directory_ls_with_grep $sysDir $serviceName
}

service_full_restart() {
    local serviceName=$1
    info "Service full restarting (stop, start, restart, status)..."
    service_start $serviceName
    service_stop $serviceName
    service_restart $serviceName
    service_status $serviceName
}

service_status_all() {
    service --status-all
}
