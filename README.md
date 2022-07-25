# Micronaut Hello World REST App with GraalVM Enterprise in Oracle Cloud Infrastructre Cloud Shell

This sample shows how you can get started quickly with GraalVM Enterprise Edition in Oracle Cloud Infrastructre (OCI) Cloud Shell. This sample uses a simple hello world REST application built with the Micronaut framework and GraalVM Enterprise Native Image and JDK.

## What is GraalVM?

GraalVM is a high-performance JDK distribution that can accelerate any Java workload running on the HotSpot JVM.

GraalVM Native Image ahead-of-time compilation enables you to build lightweight Java applications that are smaller, faster, and use less memory and CPU. At build time, GraalVM Native Image analyzes a Java application and its dependencies to identify just what classes, methods, and fields are absolutely necessary and generates optimized machine code for just those elements.

GraalVM Enterprise Edition is available for use on Oracle Cloud Infrastructure (OCI) at no additional cost.

## What is Micronaut?

Micronaut is a modern, JVM-based framework to build modular, easily testable microservice and serverless applications. By avoiding runtime reflection in favor of annotation processing, Micronaut improves the Java-based development experience by detecting errors at compile time instead of runtime, and improves Java-based application start time and memory footprint. Micronaut includes a persistence framework called Micronaut Data that precomputes your SQL queries at compilation time making it a great fit for working with databases like MySQL, Oracle Autonomous Database, etc.

Micronaut uses GraalVM Native Image to build lightweight Java applications that use less memory and CPUs, are smaller and faster because of an advanced ahead-of-time compilation technology.

## What is Cloud Shell?

Cloud Shell is a free-to-use browser-based terminal accessible from the Oracle Cloud Console. It provides access to a Linux shell with pre-authenticated OCI CLI and other pre-installed developer tools. You can use the shell to interact with OCI resources, follow labs and tutorials, and quickly run commands. 


***Note: To run this sample on local macOS instead of Cloud Shell, follow the [Prerequisites on local macOS](./README_Prereqs_local_macOS.md), and skip to the next section [Steps](#steps).***

## Prerequisites on Cloud Shell

1. Cloud Shell comes with Maven and the following GraalVM Enterprise components preinstalled: 
    - Java Development Kit (JDK), and
    - Native Image

2. List the preinstalled JDKs in Cloud Shell:

    ```shell
    $ csruntimectl java list

        graalvmeejdk-17.0.4                                    /usr/lib64/graalvm/graalvm22-ee-java17
      * openjdk-11.0.15                   /usr/lib/jvm/java-11-openjdk-11.0.15.0.9-2.0.1.el7_9.x86_64
        openjdk-1.8.0.332                /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.332.b09-1.el7_9.x86_64
    ```

3. Make GraalVM Enteprise JDK the current JDK.

    ```shell
    $ csruntimectl java set graalvmeejdk-17.0.4

    The current managed java version is set to graalvmeejdk-17.0.4.
    ```

4. Check the environment variables and versions in use:

    ```shell
    $ echo $JAVA_HOME

    /usr/lib64/graalvm/graalvm22-ee-java17
    ```

    ```shell
    $ echo $PATH

    /usr/lib64/graalvm/graalvm22-ee-java17/bin/:/ggs_client/usr/bin:/home/user_xyz/.yarn/bin:/home/user_xyz/.config/yarn/global/node_modules/.bin:/opt/oracle/sqlcl/bin:/usr/lib/oracle/21/client64/bin/:/home/oci/.pyenv/plugins/pyenv-virtualenv/shims:/home/oci/.pyenv/shims:/home/oci/.pyenv/bin:/opt/rh/rh-ruby27/root/usr/local/bin:/opt/rh/rh-ruby27/root/usr/bin:/opt/rh/rh-maven36/root/usr/bin:/opt/rh/rh-git227/root/usr/bin:/opt/rh/rh-dotnet31/root/usr/bin:/opt/rh/rh-dotnet31/root/usr/sbin:/opt/rh/httpd24/root/usr/bin:/opt/rh/httpd24/root/usr/sbin:/opt/rh/devtoolset-11/root/usr/bin:/home/oci/bin:/opt/gradle/gradle-7.4.2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/user_xyz/.composer/vendor/bin:/opt/yarn-v1.22.17/bin:/home/user_xyz/.dotnet/tools
    ```

    ```shell
    $ java -version

    java version "17.0.4" 2022-07-19 LTS   
    Java(TM) SE Runtime Environment GraalVM EE 22.2.0 (build 17.0.4+11-LTS-jvmci-22.2-b05)   
    Java HotSpot(TM) 64-Bit Server VM GraalVM EE 22.2.0 (build 17.0.4+11-LTS-jvmci-22.2-b05, mixed mode, sharing)
    ```

    ```shell
    $ native-image --version

    GraalVM 22.2.0 Java 17 EE (Java Version 17.0.4+11-LTS-jvmci-22.2-b05)
    ```

    ```shell
    $ mvn --version

    Apache Maven 3.6.1 (Red Hat 3.6.1-6.3)
    Maven home: /opt/rh/rh-maven36/root/usr/share/maven
    Java version: 17.0.4, vendor: Oracle Corporation, runtime: /usr/lib64/graalvm/graalvm22-ee-java17   
    Default locale: en_US, platform encoding: UTF-8
    OS name: "linux", version: "4.14.35-2047.513.2.2.el7uek.x86_64", arch: "amd64", family: "unix"
    ```

## Steps

1. Git clone this repo.

2. Build the app JAR

    ```shell
    mvn package
    ```

    **OR** 

    ```shell
    ./mvnw package
    ```

3. Run the app JAR in the background

    ```shell
    java -jar target/MnHelloRest-0.1.jar &
    ```

4. Test the app JAR

    4.1) Should output "Hello World"

    ```shell
    curl http://localhost:8080/
    ```

    4.2) Should output "Hello Micronaut"

    ```shell
    curl http://localhost:8080/Micronaut
    ```

5. Bring the running app JAR in the foreground

    ```shell
    fg
    ```

6. Once the app is running in the foreground, press CTRL+C to stop it.

7. Build the app native executable

    ```shell
    mvn package -Dpackaging=native-image
    ```

    **OR** 

    ```shell
    ./mvnw package -Dpackaging=native-image
    ```

8. Run the app native executable in the background

    ```shell
    ./target/MnHelloRest &
    ```

9. Test the app native executable

    9.1) Should output "Hello World"

    ```shell
    curl http://localhost:8080/
    ```

    9.2) Should output "Hello Micronaut-Graal-Native"

    ```shell
    curl http://localhost:8080/Micronaut-Graal-Native
    ```

10. Bring the running app JAR in the foreground

    ```shell
    fg
    ```

11. Once the app is running in the foreground, press CTRL+C to stop it.
