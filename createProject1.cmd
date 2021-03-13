

set studentId=%1

mvnw.cmd --batch-mode archetype:generate ^
  -DinteractiveMode=false ^
  -DarchetypeGroupId=edu.pdx.cs410J ^
  -DarchetypeArtifactId=phonebill-archetype ^
  -DarchetypeVersion=Summer2021 ^
  -DgroupId=edu.pdx.cs410J.%studentId% ^
  -DartifactId=phonebill ^
  -Dpackage=edu.pdx.cs410J.%studentId% ^
  -Dversion=Summer2021
