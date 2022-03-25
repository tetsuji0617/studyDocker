## Explain Dockerfile

### dockerfileの中身を更新する。
```
$ vi Dockerfile

更新内容は下記の通り
FROM ubuntu:latest
RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Tokyo

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN apt-get update && \
    apt-get -y upgrade
RUN apt-get autoclean
RUN apt-get install -y apache2

RUN echo 'ServerName www.example.com:80' >> /etc/apache2/apache2.conf
VOLUME ["/var/www/html"]

EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
```


### docker volume の作成
dockerコンテナが参照するvolumeを作成する。
```
$ docker volume create test_volume
test_volume
```

### docker volume の確認
作成したvolumeの確認を行う。
```
$ docker volume ls
DRIVER    VOLUME NAME
local     test_volume
```

### docker volume の詳細を確認
作成したvolumeの詳細を確認する。
```
$ docker volume inspect test_volume
[
    {
        "CreatedAt": "2022-03-22T08:24:43+09:00",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/test_volume/_data",
        "Name": "test_volume",
        "Options": {},
        "Scope": "local"
    }
]
```

### 動作確認用のファイルを配置する
作成したvolumeにファイルを配置する。ローカル側のディレクトリへのファイル配置にはroot権限が必要。
```
$ sudo su - 

$ echo 'Hello docker volume world' >> /var/lib/docker/volumes/test_volume/_data/index.html

$ exit
```

### docker imageの作成とcontainerの作成と動作確認
動作確認を行う。
```
$ docker build -t pedalclecle/ubuntu:0.4.0 .

$ docker run -p 80:80 -v test_volume:/var/www/html/ -t pedalclecle/ubuntu:0.4.0

$ curl http://localhost
Hello docker volume world
```



