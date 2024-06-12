# starter
土台となるプロジェクト
[(Docker+Rails6+Nuxt.js+PostgreSQL)=>Heroku 環境構築~デプロイまでの手順書](https://blog.cloud-acct.com/posts/u-docker-rails-nuxtjs-heroku/#4.nuxt.js%E3%82%92heroku%E3%81%AB%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4)

## Docker
- macの場合
  - Docker for Macをインストール
    - https://docs.docker.com/desktop/install/mac-install/
- windowsの場合
  - macと同様、Dockerソフトが必要（Docker Desktopは有料化された？）要調査

## Heroku
- heroku CLIをPCにインストール
- APIキーを調べセットしたり、heroku loginして操作
```
/api [master] » heroku run sh                                                                                (base)  [14:04:44]
Running sh on ⬢ coconuts-poker... up, run.3589 (Basic)
~ $ date
Tue Jun 11 14:05:30 JST 2024
~ $ exit
/api [master] » heroku pg:info                                                                               (base)  [14:05:43]
=== DATABASE_URL
Plan:                  essential-0
Status:                Available
Connections:           unknown/20
PG Version:            16.2
Created:               2024-06-11 04:52
Data Size:             unknown usage / 1 GB (In compliance)
Tables:                0/4000 (In compliance)
Fork/Follow:           Unsupported
Rollback:              Unsupported
Continuous Protection: Off
Add-on:                postgresql-lively-85680

/api [master] » heroku pg:psql postgresql-lively-85680                                                       (base)  [14:05:58]
--> Connecting to postgresql-lively-85680
psql (14.12 (Homebrew), server 16.2)
WARNING: psql major version 14, server major version 16.
         Some psql features might not work.
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

coconuts-poker::DATABASE=> show timezone;
 TimeZone
----------
 UTC
(1 row)

coconuts-poker::DATABASE=> \q
```
