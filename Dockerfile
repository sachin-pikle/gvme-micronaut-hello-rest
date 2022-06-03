#
# This is a Dockerfile to create a small runtime container image 
# by packaging the Micronaut app native executable in a 
# mostly static lightweight base image like:
# Option 1: With frolvlad/alpine-glibc, the runtime image size is 75.3 MB
# Option 2: With gcr.io/distroless/base, the runtime image size is 63.8 MB
#

# Option 1: frolvlad/alpine-glibc
FROM frolvlad/alpine-glibc AS runtime
# Option 2: gcr.io/distroless/base
# FROM gcr.io/distroless/base AS runtime

ARG APP_FILE
EXPOSE 8080
WORKDIR /home/app

COPY target/${APP_FILE} app
ENTRYPOINT ["./app"]