# u2

[![CircleCI](https://circleci.com/gh/shunta27/u2.svg?style=svg)](https://circleci.com/gh/shunta27/u2)

サイト名: Mentally (メンタリー)

内容: メンタルヘルス系SNS

プロトタイプ: http://u2-app.herokuapp.com

## How to dev

- .envの設定は僕に聞いて

```sh
# docker
$ docker-compose build
$ docker-compose up -d
# initial db
$ docker exec -it u2-app rails db:create
$ docker exec -it u2-app rails db:migrate
$ docker exec -it u2-app rails db:seed:category db:seed:user
$ docker exec -it -e RAILS_ENV=test u2-app rails db:migrate db:seed:category
# npm module
$ docker exec -it u2-app npm install
$ docker exec -it u2-app npm run watch
# test command
$ docker exec -it -e RAILS_ENV=test u2-app bundle exec rspec
```