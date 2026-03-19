```sh
```sh
```
```
mvn -B archetype:generate \
 -DarchetypeGroupId=software.amazon.awssdk \
 -DarchetypeArtifactId=archetype-lambda -Dservice=s3 -Dregion=US_WEST_2 \
 -DarchetypeVersion=2.42.16 \
 -DgroupId=com.example.myapp \
 -DartifactId=myapp
```
```
