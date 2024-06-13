## Railsの開発手順サンプル
テーブル作成からCRUDの機能を一通り作る手順

### ファイル生成
1. `rails g model Skill name`
3. `rails g controller Skills register index update delete`
4. 生成したcontrollerを `app/controllers/api/v1` へ移動する
   `Api::V1::` をclass名先頭に付与
5. migrationに設定を追記
   `null: false`や`reference`など
6. `api/config/routes.rb` のルーティング情報を更新
   get, post, put, deleteとコントローラへのリダイレクトを書く
8. rspecのファイルを作成&記述する（`api/spec/requests`）
   ※swaggerのため。テストの中身は考慮していない

### コマンド実行
1. テーブル作成（migration）
   `rails db:migrate`
2. swagger.yml生成
   `RAILS_ENV=test rake rswag:specs:swaggerize`
   ※先にmigrationしないとswagger生成に失敗する
   ※Warningやfailedが出るが、examples に数字が出ていればファイル生成には成功
```
Finished in 0.00186 seconds (files took 1.92 seconds to load)
14 examples, 0 failures
```
4. swagger.ymlに検証環境のswagger設定を追記
   ※自動生成により消えてしまうので毎回末尾の `server` 項目に追加
```
servers:
- url: http://localhost:3000
  description: '開発環境'
- url: https://coconuts-poker-87d283940a6e.herokuapp.com
  description: '検証環境'
```

### 動作テスト
- swaggerからCRUDを試す（[http://localhost:3000/api-docs/index.html](http://localhost:3000/api-docs/index.html)）
