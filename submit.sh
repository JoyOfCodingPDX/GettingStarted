#!/bin/bash

source "$(dirname "$0")/prerequisites.sh"

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
submitClass="Submit"
mavenGoals="clean verify"
srcDirectory="src"

if [[ "$project" == "Project0"  ]]; then
  directory="student"

elif [[ "$project" == "koans"  ]]; then
  directory="koans"
  mavenGoals="clean exec:java"

elif [[ "$project" == "Project5"  ]]; then
  directory="airline-web"

elif [[ "$project" == "Project6"  ]]; then
  directory="airline-android"
  submitClass="SubmitAndroidProject"
  srcDirectory="."

else
  directory="airline"
fi

if [ $# -gt 1 ]; then
  comment=$2

else
  comment=""
fi

top=$(dirname "$0")
xmlFile=${top}/me.xml
projectDirectory=${top}/${directory}
pomFile=${projectDirectory}/pom.xml

localChanges=`git status --porcelain ${projectDirectory}`
if [[ ${localChanges} ]]; then
  echo "** There are local modifications that haven't been committed"
  echo ${localChanges}
  echo "** Please commit or revert these changes before submitting"
  exit 1
fi

if [ -f $pomFile ]; then
  cd ${projectDirectory}
  chmod +x ./mvnw
  ./mvnw -Pgrader ${mavenGoals}
  cd -
fi

java -cp /u/whitlock/jars/grader.jar edu.pdx.cs.joy.grader.${submitClass} -comment "${comment}" "${project}" "${xmlFile}" "${projectDirectory}/${srcDirectory}"

submitTime=`date +%Y%m%dT%I%M%S`
tag="submit-${project}-${submitTime}"
rev=`git rev-parse --short HEAD`
echo "** Tagging HEAD revision ${rev} with \"${tag}\""
git tag --annotate ${tag} -m "${project} submitted on ${submitTime}"
