**開発環境構築**
- プロジェクトのフォルダーを作成
```
// ターミナル
cd Desktop
mkdir laravel_project
cd laravel_project
```

作成後、
```
docker-compose up -d
```

- laravelをインストール
コンテナが立ち上がったら、laravelをインストール（今後は自動化予定）
```
docker-compose exec php composer create-project --prefer-dist "laravel/laravel=6.*" .
```

-  Laravelのサーバーを起動
```
docker-compose exec php php artisan serve --host=0.0.0.0 --port=8000
```