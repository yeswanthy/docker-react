# getting base image to run nom commands

FROM node:alpine as builder

WORKDIR '/app'

COPY ./package.json ./

RUN npm install

COPY ./ ./

RUN npm run build


FROM nginx

# this is in order to open port, elastickbeanstalk gives error
EXPOSE 80

COPY --from=builder  /app/build /usr/share/nginx/html

