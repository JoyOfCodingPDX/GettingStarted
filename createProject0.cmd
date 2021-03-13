

set studentId=%1

mvnw.cmd --batch-mode archetype:generate ^
  -DinteractiveMode=false ^
  -DarchetypeGroupId=edu.pdx.cs410J ^
  -DarchetypeArtifactId=student-archetype ^
  -DarchetypeVersion=Summer2021 ^
  -DgroupId=edu.pdx.cs410J.%studentId% ^
  -DartifactId=student ^
  -Dpackage=edu.pdx.cs410J.%studentId% ^
  -Dversion=Summer2021
