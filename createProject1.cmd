
@echo off
@setlocal

if "%~1"=="" goto missingArgs

set studentId=%1

mvnw.cmd --batch-mode archetype:generate ^
  -DinteractiveMode=false ^
  -DarchetypeGroupId=edu.pdx.cs410J ^
  -DarchetypeArtifactId=apptbook-archetype ^
  -DarchetypeVersion=Summer2021 ^
  -DgroupId=edu.pdx.cs410J.%studentId% ^
  -DartifactId=apptbook ^
  -Dpackage=edu.pdx.cs410J.%studentId% ^
  -Dversion=Summer2021

exit 0

:missingArgs

echo "** You must specify a student id"
cmd /C exit /B 1
