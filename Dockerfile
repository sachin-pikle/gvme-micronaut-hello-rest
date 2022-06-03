#
# This is a Dockerfile to create a small runtime container image by 
# packaging the Micronaut app native executable as a “mostly static” 
# native image which statically links everything except libc. 
# Statically linking all your libraries except glibc ensures your 
# application has all the libraries it needs to run on any 
# Linux glibc-based distribution like "gcr.io/distroless/base". 
# The application runtime image size is only 63.8 MB.
# 
# Reference: https://www.graalvm.org/22.1/reference-manual/native-image/StaticImages/#build-mostly-static-native-image
#

FROM gcr.io/distroless/base AS runtime

ARG APP_FILE
EXPOSE 8080
WORKDIR /home/app

COPY target/${APP_FILE} app
ENTRYPOINT ["./app"]