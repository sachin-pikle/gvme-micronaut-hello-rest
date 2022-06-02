# micronaut-hello

This is a simple hello web application using the Micronaut framework and GraalVM Native Image.

## App JAR

### Build the app JAR

```shell
mvn package
```

**OR** 

```shell
./mvnw package
```

### Run the app JAR

```shell
java -jar target/mn-hello-0.1.jar
```

### Test the app JAR

- http://localhost:8080/ should output "Hello World"

- http://localhost:8080/Micronaut should output "Hello Micronaut"


## App native executable

### Build the app native executable

```shell
mvn package -Dpackaging=native-image
```

**OR** 

```shell
./mvnw package -Dpackaging=native-image
```

### Run the app native executable

```shell
./target/mn-hello
```

### Test the app native executable

- http://localhost:8080/ should output "Hello World"

- http://localhost:8080/Micronaut-Graal-Native should output "Hello Micronaut-Graal-Native"
