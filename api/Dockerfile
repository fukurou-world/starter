FROM ruby:3.0.5-alpine

ARG WORKDIR

ENV RUNTIME_PACKAGES="linux-headers libxml2-dev libxml2-utils make gcc libc-dev nodejs tzdata postgresql-dev postgresql git" \
    DEV_PACKAGES="build-base curl-dev" \
    HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

# ENV test（このRUN命令は確認のためなので無くても良い）
RUN echo ${HOME}

WORKDIR ${HOME}

COPY Gemfile* ./

# gemバージョン指定
RUN gem update --system 3.3.22

# nokogiriのネイティブ拡張機能をインストール
RUN bundle config set force_ruby_platform true

RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
    bundle install -j4 && \
    apk del build-dependencies

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]