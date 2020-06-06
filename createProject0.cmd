
@echo off
@setlocal

if "%~1"=="" goto missingArgs

set studentId=%1

mvnw.cmd --batch-mode archetype:generate ^
  -DinteractiveMode=false ^
  -DarchetypeGroupId=edu.pdx.cs410J ^
  -DarchetypeArtifactId=student-archetype ^
  -DarchetypeVersion=Summer2020 ^
  -DgroupId=edu.pdx.cs410J.%studentId% ^
  -DartifactId=student ^
  -Dpackage=edu.pdx.cs410J.%studentId% ^
  -Dversion=Summer2020

:missingArgs

echo "** You must specify a student id"
cmd /C exit /B 1
