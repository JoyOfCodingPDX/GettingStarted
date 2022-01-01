#!/bin/bash

source $(dirname "$0")/prerequisites.sh

if ! runningOnPSUMachine; then
    echo "** This script can only be run on a PSU CECS Linux Machine"
    exit 1
fi

if [ $# -lt 1 ]; then
  echo "** You must specify a project name"
  exit 1
fi

if ! checkForJava; then
    echo "** Java is not configured correctly in your environment"
    exit 1
fi

project=$1

if [[ "$project" == "Project0"  ]]; then
  directory="student"

elif [[ "$project" == "Project4"  ]]; then
  directory="airline-web"

else
  directory="airline"
fi

top=$(dirname "$0")
xmlFile=${top}/me.xml
projectDirectory=${top}/${directory}

${top}/mvnw --file ${projectDirectory}/pom.xml -Dgrader clean verify

java -cp /u/whitlock/jars/grader.jar edu.pdx.cs410J.grader.Submit ${project} ${xmlFile} ${projectDirectory}/src

