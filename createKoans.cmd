

set studentId=%1

mvnw.cmd --batch-mode archetype:generate ^
  -DinteractiveMode=false ^
  -DarchetypeGroupId=edu.pdx.cs410J ^
  -DarchetypeArtifactId=java-koans-archetype ^
  -DarchetypeVersion=Winter2020 ^
  -DgroupId=edu.pdx.cs410J.%studentId% ^
  -DartifactId=koans ^
  -Dpackage=edu.pdx.cs410J.%studentId% ^
  -Dversion=Winter2020
