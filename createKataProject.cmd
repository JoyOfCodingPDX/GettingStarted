

set projectName=%1
set studentId=%2

mvnw.cmd --batch-mode archetype:generate ^
  -DinteractiveMode=false ^
  -DarchetypeGroupId=edu.pdx.cs410J ^
  -DarchetypeArtifactId=kata-archetype ^
  -DarchetypeVersion=Winter2020 ^
  -DgroupId=edu.pdx.cs410J.%studentId% ^
  -DartifactId=%projectName% ^
  -Dpackage=edu.pdx.cs410J.%studentId% ^
  -Dversion=Winter2020
