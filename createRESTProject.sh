#!/bin/bash

source prerequisites.sh

if ! checkForJava; then
    echo "** Java is not configured correctly in your environment"
    exit 1
fi

if [[ $# -gt 0 ]]; then
    loginId=$1

else
    loginId=$(getLoginIdFromXmlFile)
    if [[ -z "${loginId}" ]]; then
    	echo "** Could not load login id from me.xml"
    	exit 1
    fi
fi

createProjectFromArchetype ${loginId} "airline-web"
