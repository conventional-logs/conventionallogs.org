FROM node:alpine
WORKDIR /src/
COPY ./themes/conventional-logs /src/
RUN apk add python make g++
RUN npm rebuild node-sass
RUN npm install
RUN npm run build

FROM jguyomard/hugo-builder:latest
COPY ./ /src/
COPY --from=0 /src/ /src/themes/conventional-logs/
RUN hugo

FROM nginx:stable
COPY --from=1 /src/public/ /usr/share/nginx/html/
EXPOSE 80