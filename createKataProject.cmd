@echo off
@setlocal

if "%~2"=="" goto missingArgs

set projectName=%1
set studentId=%2

mvnw.cmd --batch-mode archetype:generate ^
  -DinteractiveMode=false ^
  -DarchetypeGroupId=io.github.davidwhitlock.cs410J ^
  -DarchetypeArtifactId=kata-archetype ^
  -DarchetypeVersion=2022.1.0-SNAPSHOT ^
  -DgroupId=edu.pdx.cs410J.%studentId% ^
  -DartifactId=%projectName% ^
  -Dpackage=edu.pdx.cs410J.%studentId% ^
  -Dversion=2022.0.0

exit 0

:missingArgs

echo "** You must specify a project name and a student id"
cmd /C exit /B 1
