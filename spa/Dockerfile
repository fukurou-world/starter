FROM node:20.14.0-alpine
ENV TZ Asia/Tokyo

WORKDIR /app

RUN apk update \
    && apk add \
    git \
    vim

COPY package*.json ./
RUN yarn install

COPY . .

RUN yarn run build
RUN yarn run generate