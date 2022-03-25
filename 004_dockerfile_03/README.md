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


### dockerのイメージ作成
dockerのイメージを作成する前に現状のイメージを確認する。
```
$ docker volume create test_volume
test_volume
```

### docker volume の確認
```
$ docker volume ls
DRIVER    VOLUME NAME
local     test_volume
```

### docker volume の詳細を確認
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

### 動作確認用のファイルを配置する。
```
$ sudo su - 

$ echo 'Hello docker volume world' >> /var/lib/docker/volumes/test_volume/_data/index.html

$ exit
```

### docker image の作成とcontainerの作成と動作確認
```
$ docker build -t pedalclecle/ubuntu:0.4.0 .

$ docker run -p 80:80 -v test_volume:/var/www/html/ -t pedalclecle/ubuntu:0.4.0

$ curl http://localhost
Hello docker volume world
```



