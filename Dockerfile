FROM node:14-alpine
RUN apk --no-cache add git

WORKDIR /usr/src/app
