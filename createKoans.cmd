
@echo off
@setlocal

if "%~1"=="" goto missingArgs

set studentId=%1

mvnw.cmd --batch-mode archetype:generate ^
  -DinteractiveMode=false ^
  -DarchetypeGroupId=io.github.davidwhitlock.cs410J ^
  -DarchetypeArtifactId=java-koans-archetype ^
  -DarchetypeVersion=2021.3.0 ^
  -DgroupId=edu.pdx.cs410J.%studentId% ^
  -DartifactId=koans ^
  -Dpackage=edu.pdx.cs410J.%studentId% ^
  -Dversion=2021.0.0

exit 0

:missingArgs

echo "** You must specify a student id"
cmd /C exit /B 1
