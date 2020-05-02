#!/bin/bash

source checkForJava.sh

if ! checkForJava; then
    echo "** Java is not configured correctly in your environment"
    exit 1
fi

if ! checkForMavenSettings; then
    echo "** Your Maven settings are not configured correctly in your environment"
    exit 1
fi

if [ $# -lt 1 ]; then
  echo "** You must specify a project name and a student id"
  exit 1

elif [ $# -lt 2 ]; then
  echo "** Missing your student id"
  exit 1
fi


projectName=$1
studentId=$2

./mvnw --batch-mode archetype:generate \
  -DinteractiveMode=false \
  -DarchetypeGroupId=edu.pdx.cs410J \
  -DarchetypeArtifactId=kata-archetype \
  -DarchetypeVersion=Summer2020 \
  -DgroupId=edu.pdx.cs410J.${studentId} \
  -DartifactId=$projectName \
  -Dpackage=edu.pdx.cs410J.${studentId} \
  -Dversion=Summer2020
