# u2

[![CircleCI](https://circleci.com/gh/shunta27/u2.svg?style=svg)](https://circleci.com/gh/shunta27/u2)

サイト名: Mentally (メンタリー)

内容: メンタルヘルス系SNS

## How to dev

- .envの設定は僕に聞いて

```shell
$ docker-compose up -d
$ docker exec -it u2-app rails db:create
$ docker exec -it u2-app rails db:migrate
$ docker exec -it u2-app rails db:seed:category db:seed:user
$ docker exec -it u2-app npm install
$ docker exec -it u2-app npm run watch
```