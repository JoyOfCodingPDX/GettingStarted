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
xmlFile=$(dirname "$0")/me.xml
if [[ "$project" == "Project4"  ]]; then
  directory="apptbook-web"

elif [[ "$project" == "Project0"  ]]; then
  directory="student"

else
  directory="apptbook"
fi

java -cp /u/whitlock/jars/grader.jar edu.pdx.cs410J.grader.Submit ${project} ${xmlFile} ${directory}/src

