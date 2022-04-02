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

RUN mkdir -p /var/www/html
RUN echo 'Hello Docker world' > /var/www/html/index.html
RUN echo 'ServerName www.example.com:80' >> /etc/apache2/apache2.conf
VOLUME ["/var/www/html"]

EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
```


### dockerのイメージ作成
dockerのイメージを作成する前に現状のイメージを確認する。
```
$ docker images
REPOSITORY                          TAG                 IMAGE ID       CREATED       SIZE
ubuntu                              latest              e784f03641c9   2 days ago    65.6MB
pedalclecle/ubuntu                  0.1.0               e784f03641c9   6 days ago    65.6MB
pedalclecle/ubuntu                  0.2.0               e768e2e4c4a9   3 days ago    97.8MB
```

dockerのイメージを作成する。
```
$ docker build -t pedalclecle/ubuntu:0.3.0 .
```

イメージの作成状況を確認する。
```
$ docker images
REPOSITORY                          TAG                 IMAGE ID       CREATED       SIZE
ubuntu                              latest              e784f03641c9   2 days ago    65.6MB
pedalclecle/ubuntu                  0.1.0               e784f03641c9   2 days ago    65.6MB
pedalclecle/ubuntu                  0.2.0               e768e2e4c4a9   3 days ago    97.8MB
pedalclecle/ubuntu                  0.3.0               531bab7c8d56   2 days ago    211MB
```

dockerのコンテナを作成する。
```
$ docker run -p 80:80 pedalclecle/ubuntu:0.3.0 
```

コンテナの動作確認
```
$ curl http://localhost
Hello Docker world
```
