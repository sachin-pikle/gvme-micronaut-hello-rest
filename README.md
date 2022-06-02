# micronaut-hello

## App JAR

### Build app JAR
```shell
mvn package
```

**OR** 

```shell
./mvnw package
```

### Run the app JAR

```shell
java -jar target/micronautguide-0.1.jar
```

### Test the app JAR

- http://localhost:8080/ should output "Hello World"

- http://localhost:8080/Micronaut should output "Hello Micronaut"


## Build the app native executable

```shell
mvn package -Dpackaging=native-image
```

**OR** 

```shell
./mvnw package -Dpackaging=native-image
```


## Run the app native executable

```shell
./target/
```
