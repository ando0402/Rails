#FROM ruby:3.2.4
FROM ruby:3.2.4-alpine3.18

RUN apk update -qq && apk add gcompat libpq-dev nodejs vim g++ make

# コンテナの作業ディレクトリ
WORKDIR /app

COPY ../ ../

RUN bundle install

CMD [ "bundle", "exec", "sidekiq", "-C", "config/sidekiq.yml"  ]