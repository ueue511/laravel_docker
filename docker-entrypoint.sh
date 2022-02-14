#! /bin/sh
DIR="src"
# if [ ! -f ~/ .exec-once ] ;then
#   npm install && touch ~/ .exec-once
# fi

if [ ! -d $DIR ];then
  echo 'laravel install start'
  composer create-project --prefer-dist "laravel/laravel=6.*" .
fi


php artisan serve --host=0.0.0.0 --port=8000
tail -f /dev/null