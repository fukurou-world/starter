FROM node:20.14.0-alpine
ENV TZ Asia/Tokyo

WORKDIR /app

ENV PATH="/app/node_modules/.bin:$PATH"
# ENV BASE_URL="https://samplecoomm.coma" ここでAPI base URLを渡す

RUN apk update \
    && apk add \
    git \
    vim

COPY package*.json ./
RUN yarn install --frozen-lockfile

COPY . .

RUN yarn run build
RUN yarn run generate