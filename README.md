### 開発環境
- ruby '2.6.5'
- rails '~> 6.0.1'
### どのようなサイトか
クラウドファンディングサイト　　
https://camp-fire.jp/  
### 主な機能
  - プロジェクトを投稿する
  - プロジェクトに寄付する
  - 寄付に対するリターンを投稿する
  - メール通知
  - いいね機能
### 環境開発とセットアップ
1.git@github.com:shuma1020/training_app.gitをcloneする  
2.rbenvをインストール  
3.postgresSQLをインストール  
4.bundlerを使ってGemをインストールbundle install --path vendor/bundle  
5. bin/rails create  
6. bin/rails db:migrate  
7. bin/rails db:seed  
8.サーバーを起動  
  
### 学んだ・使っているテクニック
- アソシエーション
  中間テーブル
- ActiveRecord
- namespace
- ネスト
- enum
- bootstrap
- transaction
- バリデーション
  カスタムバリデーション
- haml




