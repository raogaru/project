
mvn --version

mvn archetype:generate -DgroupId=com.app.example -DartifactId=HelloWorldApp -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

cp HelloWorldApp.xml HelloWorldApp/pom.xml

cp HelloWorldApp.java HelloWorldApp/src/main/java/com/app/example/App.java

cd HelloWorldApp

mvn package

cd ..

cp HelloWorldApp/target/HelloWorld-1.war .

rm -rf HelloWorldApp

