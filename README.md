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
コンテナが立ち上がったら、laravelをインストール（今後は自動化したい）
```
docker-compose exec php composer create-project --prefer-dist "laravel/laravel=6.*" .
```

-  Laravelのサーバーを起動
```
docker-compose exec php php artisan serve --host=0.0.0.0 --port=8000
```

**ログイン実装**
```
composer require laravel/ui:^1.0
php artisan ui vue --auth
npm install // *1
npm run dev // *2
```

```
//vimのinstall
apt-get update
apt-get install vim
```

**DBのカラムの名前変更時に必要（Laravel６.２の場合）
```
composer require laravel/ui:1.*
composer require "doctrine/dbal:2.*"
```

*1 bash: npm: command not found // 原因 node.jsが入ってない

【解決方法】
$ curl -L git.io/nodebrew | perl - setup
$ export PATH=$HOME/.nodebrew/current/bin:$PATH

*2 PHP Fatal error:  Allowed memory size of 1610612736 bytes exhausted (tried to allocate 4096 bytes) in phar:///usr/local/bin/composer/src/Composer/DependencyResolver/Solver.php on line 223

// 原因 メモリの不足が原因

【解決方法】
現在のメモリを確認
```
$ php -r "echo ini_get('memory_limit').PHP_EOL;"
```
php.iniファイルを開く
```
// php.iniのファイルpathを調べる
$ php --ini | grep "php.ini"

// php.iniを開く
$ sudo vi /etc/php.ini

//php.iniに追加
; Maximum amount of memory a script may consume (128MB)
; http://php.net/memory-limit
memory_limit = -1

// もしくは、composerの前に COMPOSER_MEMORY_LIMIT=-1 を追加する
COMPOSER_MEMORY_LIMIT=-1 composer require barryvdh/laravel-debugbar
```

```
//vimのinstall
apt-get update
apt-get install vim
```
//config/debugbar.phpを作成。
php artisan vendor:publish --provider="Barryvdh\Debugbar\ServiceProvider"
```