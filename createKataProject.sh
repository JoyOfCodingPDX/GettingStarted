#!/bin/bash

source prerequisites.sh

if [ $# -lt 1 ]; then
  echo "** You must specify a project name and a one-word team name"
  exit 1

elif [ $# -lt 2 ]; then
  echo "** Missing your one-word team name"
  exit 1
fi


projectName=$1
teamName=$2

createProjectFromArchetype ${teamName} "kata" "2.2.0" ${projectName}
