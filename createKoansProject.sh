#!/bin/bash

source prerequisites.sh

if [[ $# -gt 0 ]]; then
    loginId=$1

else
    loginId=$(getLoginIdFromXmlFile)
    if [[ -z "${loginId}" ]]; then
    	echo "** Could not load login id from me.xml"
    	exit 1
    fi
fi

createProjectFromArchetype ${loginId} "java-koans" "2.2.3" "koans"
