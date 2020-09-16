#!/bin/bash

. ./file-helper.sh

create_and_run_service() {
    local serviceName=$1
    local serviceFilePath=$2
    local serviceFileName=$serviceName.service
    local sysDir=/etc/systemd/system
    local systemPath="$sysDir/$serviceFileName"
    local curdir=$pwd
    # cp akarim-service.service /etc/systemd/system/akarim-service.service
    service_chmod $serviceFilePath
    sudo_force_copy $serviceFilePath $systemPath
    
    move_to_directory_ls_with_grep $sysDir $serviceName
    service_chmod $systemPath
    service_enable $serviceName
    service_start $serviceName
    service_status $serviceName
}

service_chmod() {
    local path=$1
    info "$path - applying chmod 644 $path ..."
    sudo chmod 644 $path
}

service_start() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    info "$serviceFileName - service starting..."
    systemctl --user start $serviceFileName
}

service_stop() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    info "$serviceFileName - service stopping..."
    systemctl --user stop $serviceFileName
}

service_status() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    info "$serviceFileName - service status..."
    systemctl status $serviceFileName
}

service_enable() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    info "$serviceFileName - service enabled..."
    systemctl --user enable --now $serviceFileName
}

service_restart() {
    local serviceName=$1
    local serviceFileName=$serviceName.service
    info "$serviceFileName - service restarting..."
    systemctl --user restart $serviceFileName
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
    systemctl disable $serviceFileName
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
