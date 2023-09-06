FROM alpine:latest

RUN apk update
RUN apk add --no-cache curl
RUN apk add --no-cache git
RUN apk add --no-cache nodejs npm
RUN apk add --no-cache python3
RUN npm install -g yarn
RUN yarn global add knex-migrator ember-cli

WORKDIR /app
COPY . .
RUN yarn setup
EXPOSE 8080
ENTRYPOINT [ "yarn" , "dev" , "--portal" ]