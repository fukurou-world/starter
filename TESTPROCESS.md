## 開発環境でのプロジェクト起動
### 環境変数のファイルを準備
- `.env`を入手
  - [fukurou Drive](https://drive.google.com/drive/folders/1JDb9KpvwGzxm1AJRMaAd2phWjzGdfsau)にあります（matching-env.txt）
  - `matching-env-api.txt` は、アカウント作成時のメール確認で使う設定ファイルです
- ダウンロードしたら、名前を`.env`に変更する
- ローカルのリポジトリ直下に配置
<img width="811" alt="スクリーンショット 2024-06-28 20 38 19" src="https://github.com/fukurou-world/matching/assets/170231158/960e59bc-90e4-44e1-a190-f45ed64ef668">

### 開発環境構築手順

1. ターミナル（iTerm 2やPower shellなど）を開く

2. cloneしたリポジトリを開く
   （docker-compose.ymlがあるディレクトリ）

<img width="806" alt="スクリーンショット 2024-06-28 18 50 37" src="https://github.com/fukurou-world/matching/assets/170231158/7a0dcc47-da54-4151-936f-9f545dcbedf6">

4. コマンド実行

   それぞれ処理が止まるまで待ち、終わったら次コマンドを実行します。

   数十分終わらないなど様子がおかしかったら連絡ください。（キャプチャ添付希望）
   
   - `docker-compose run --rm api rails db:create`（DBを作成）
   - `docker-compose up`（全てのサーバーを一括起動）
   - `docker-compose exec api sh`（apiのサーバーにアクセスして操作する）
   - `rails db:migrate RAILS_ENV=development`（マイグレーション実行（DBにテーブルを作成する処理））
  
7. ブラウザで開く `http://localhost:8080/`
8. swaggerを開く `http://localhost:3000/api-docs/index.html`

   swaggerでデータを入れるなどできます
