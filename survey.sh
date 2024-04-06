#!/bin/bash

source prerequisites.sh

if ! runningOnPSUMachine; then
    echo "** This script can only be run on a PSU CECS Linux Machine"
    exit 1
fi



if ! checkForJava; then
    echo "** Java is not configured correctly in your environment"
    exit 1
fi



java -cp /u/whitlock/jars/grader.jar edu.pdx.cs.joy.grader.Survey

echo ""
echo "** Thank you for filling out the survey"

git add me.xml

echo ""
echo "** Don't forget to commit me.xml to your git repository"
