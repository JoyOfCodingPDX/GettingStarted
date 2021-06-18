@echo off
@setlocal

if "%~2"=="" goto missingArgs

set projectName=%1
set studentId=%2

mvnw.cmd --batch-mode archetype:generate ^
  -DinteractiveMode=false ^
  -DarchetypeGroupId=io.github.davidwhitlock.cs410J ^
  -DarchetypeArtifactId=kata-archetype ^
  -DarchetypeVersion=2021.3.0 ^
  -DgroupId=edu.pdx.cs410J.%studentId% ^
  -DartifactId=%projectName% ^
  -Dpackage=edu.pdx.cs410J.%studentId% ^
  -Dversion=2021.0.0

exit 0

:missingArgs

echo "** You must specify a project name and a student id"
cmd /C exit /B 1
