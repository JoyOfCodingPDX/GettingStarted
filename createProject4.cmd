

set studentId=%1

mvnw.cmd --batch-mode archetype:generate ^
  -DinteractiveMode=false ^
  -DarchetypeGroupId=edu.pdx.cs410J ^
  -DarchetypeArtifactId=phonebill-web-archetype ^
  -DarchetypeVersion=Summer2021 ^
  -DgroupId=edu.pdx.cs410J.%studentId% ^
  -DartifactId=phonebill-web ^
  -Dpackage=edu.pdx.cs410J.%studentId% ^
  -Dversion=Summer2021
