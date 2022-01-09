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

echo "** Creating project for ${loginId}"

./mvnw --batch-mode archetype:generate \
  -DinteractiveMode=false \
  -DarchetypeGroupId=io.github.davidwhitlock.cs410J \
  -DarchetypeArtifactId=airline-web-archetype \
  -DarchetypeVersion=2022.0.0 \
  -DgroupId=edu.pdx.cs410J.${loginId} \
  -DartifactId=airline-web \
  -Dpackage=edu.pdx.cs410J.${loginId} \
  -Dversion=2022.0.0
