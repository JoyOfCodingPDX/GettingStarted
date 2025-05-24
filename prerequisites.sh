#!/bin/sh

## Load the login id from the me.xml file
##
## awk command from here: https://stackoverflow.com/questions/14054203/extract-xml-tag-value-using-awk-command

function getLoginIdFromXmlFile() {
    xmlFile="me.xml"
    if [[ -r ${xmlFile} ]]; then
      awk -F '[<>]' '/id/{print $3}' ${xmlFile} | head -1
      return
    fi
}

## Check to see if this script is run on one of the PSU CECS Linux machines

function runningOnPSUMachine() {
    psuHostname=$(hostname --long 2>&1 | grep "cs.pdx.edu")
    if [[ -n "$psuHostname" ]]; then
        echo "You are running on PSU machine: ${psuHostname}"
    else
      	return 1
    fi

    if [[ -r "/u/whitlock/jars/grader.jar" ]]; then
	echo "grader jar is present"
    else
	echo "Could not find the grader jar on ${psuHostname}.  Did Dave forget to make it world-readable again?  Ask him."
	return 1
    fi
}

## Check to see if the required version of Java is available on the
## command line PATH 
##
## Adapted from
## https://stackoverflow.com/questions/7334754/correct-way-to-check-java-version-from-bash-script/7335120

function checkForJava() {
    if type -p java; then
        echo "Found java executable in execution PATH"
        _java=java
    elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
        echo "Found java executable in JAVA_HOME"
        _java="$JAVA_HOME/bin/java"
    else
        echo "Could not find java in your environment"
        return 1
    fi
    
    if [[ "$_java" ]]; then
        version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
        minimumVersion="21"
        echo "You are running Java version \"$version\""
        if [[ "$version" > "$minimumVersion" ]]; then
            echo This version of Java is sufficient for this course
            return 0
        else         
            echo "** This version of Java is sufficient NOT for this course."
            echo "** Please install at least version ${minimumVersion} of the JDK."
            return 1
        fi
    fi
}

function createProjectFromArchetype() {
    loginId=$1
    archetypeName=$2
    archetypeVersion=$3

    if [[ $# -gt 3 ]]; then
	projectName=$4
    else 
	projectName=${archetypeName}
    fi

    if ! runningOnPSUMachine; then
        echo "** This script can only be run on a PSU CECS Linux Machine"
        exit 1
    fi

    if ! checkForJava; then
        echo "** Java is not configured correctly in your environment"
        exit 1
    fi

    echo "** Creating ${archetypeName} project for ${loginId}"

    ./mvnw --batch-mode archetype:generate \
	   -DinteractiveMode=false \
	   -DarchetypeGroupId=io.github.davidwhitlock.joy \
	   -DarchetypeArtifactId=${archetypeName}-archetype \
	   -DarchetypeVersion=${archetypeVersion} \
	   -DgroupId=edu.pdx.cs.joy.${loginId} \
	   -DartifactId=${projectName} \
	   -Dpackage=edu.pdx.cs.joy.${loginId} \
	   -Dversion=1.0.0

    chmod +x ${projectName}/mvnw
}
