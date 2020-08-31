#!/bin/bash

get_current_user() {
    echo $USER
}

get_logged_in_users(){
    echo $(who | cut -d ' ' -f1 | sort | uniq)
}

get_current_user_logged() {
    echo $(whoami)
}