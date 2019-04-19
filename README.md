# u2

サイト名: Mentally (メンタリー)

内容: メンタルヘルス系SNS

## How to dev

- .envの設定は僕に聞いて

```shell
$ docker-compose up
$ docker exec -it u2-app npm install
$ docker exec -it u2-app rake db:migrate
$ docker exec -it u2-app rake db:seed:category
$ docker exec -it u2-app rake db:seed:user
```