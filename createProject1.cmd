

set studentId=%1

mvnw.cmd --batch-mode archetype:generate ^
  -DinteractiveMode=false ^
  -DarchetypeGroupId=edu.pdx.cs410J ^
  -DarchetypeArtifactId=apptbook-archetype ^
  -DgroupId=edu.pdx.cs410J.%studentId% ^
  -DartifactId=apptbook ^
  -Dpackage=edu.pdx.cs410J.%studentId% ^
  -Dversion=Summer2019
