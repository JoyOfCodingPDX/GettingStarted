

set studentId=%1

mvnw.cmd --batch-mode archetype:generate ^
  -DinteractiveMode=false ^
  -DarchetypeGroupId=edu.pdx.cs410J ^
  -DarchetypeArtifactId=airline-web-archetype ^
  -DarchetypeVersion=Winter2020 ^
  -DgroupId=edu.pdx.cs410J.%studentId% ^
  -DartifactId=airline-web ^
  -Dpackage=edu.pdx.cs410J.%studentId% ^
  -Dversion=Winter2020
