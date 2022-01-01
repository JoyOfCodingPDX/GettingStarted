#!/bin/bash

source prerequisites.sh

if ! checkForJava; then
    echo "** Java is not configured correctly in your environment"
    exit 1
fi

if [ $# -lt 1 ]; then
  echo "** You must specify a project name and a one-word team name"
  exit 1

elif [ $# -lt 2 ]; then
  echo "** Missing your one-word team name"
  exit 1
fi


projectName=$1
teamName=$2

./mvnw --batch-mode archetype:generate \
  -DinteractiveMode=false \
  -DarchetypeGroupId=io.github.davidwhitlock.cs410J \
  -DarchetypeArtifactId=kata-archetype \
  -DarchetypeVersion=2022.0.0 \
  -DgroupId=edu.pdx.cs410J.${teamName} \
  -DartifactId=$projectName \
  -Dpackage=edu.pdx.cs410J.${teamName} \
  -Dversion=2022.0.0
