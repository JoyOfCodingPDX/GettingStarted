
@echo off
@setlocal

if "%~1"=="" goto missingArgs

set studentId=%1

mvnw.cmd --batch-mode archetype:generate ^
  -DinteractiveMode=false ^
  -DarchetypeGroupId=io.github.davidwhitlock.cs410J ^
  -DarchetypeArtifactId=phonebill-archetype ^
  -DarchetypeVersion=2023.0.0-SNAPSHOT ^
  -DgroupId=edu.pdx.cs410J.%studentId% ^
  -DartifactId=phonebill ^
  -Dpackage=edu.pdx.cs410J.%studentId% ^
  -Dversion=2023.0.0

exit 0

:missingArgs

echo "** You must specify a student id"
cmd /C exit /B 1
