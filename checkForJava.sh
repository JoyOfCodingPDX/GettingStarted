#!/bin/sh

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
        minimumVersion="11"
        echo You are running Java version "$version"
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

checkForMavenSettings() {
    if [ ! -f "$HOME/.m2/settings.xml" ]; then
        echo "** settings.xml does not exist"
        echo "** Copy settings.xml into $HOME/.m2/settings.xml"
        return 1
    fi

    local url=https://dl.bintray.com/davidwhitlock/maven
    
    if ! grep -q $url "$HOME/.m2/settings.xml"; then
        echo "** Your settings.xml file does not contain $url"
        echo "** Please place information from local settings.xml into $HOME/.m2/settings.xml"
        return 1
    fi

    return 0

}