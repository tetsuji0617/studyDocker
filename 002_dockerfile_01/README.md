## Explain Dockerfile

### dockerfileの中身を更新する。
```
$ vi Dockerfile

更新内容は下記の通り
FROM ubuntu:latest
RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Tokyo
```

- FROM:ベースとなるイメージを取得する。上記の例はubuntuイメージの最新を取得する。
- RUN:コマンドを実行し、その結果を確定させます。上の例はubuntuのモジュールの最新かとtzdataをインストール。
- ENV:環境変数を設定する。上記の例はタイムゾーンを東京にセット。


### dockerのイメージ作成
dockerのイメージを作成する前に現状のイメージを確認する。
```
$ docker images
REPOSITORY                          TAG                 IMAGE ID       CREATED       SIZE
ubuntu                              latest              e784f03641c9   2 days ago    65.6MB
pedalclecle/ubuntu                  0.1.0               e784f03641c9   2 days ago    65.6MB
```

dockerのイメージを作成する。
```
$ docker build -t pedalclecle/ubuntu:0.2.0 .
```

イメージの作成状況を確認する。
```
:~/002_dockerfile_01$ docker images
REPOSITORY                          TAG                 IMAGE ID       CREATED              SIZE
ubuntu                              latest              e784f03641c9   2 days ago           65.6MB
pedalclecle/ubuntu                  0.1.0               e784f03641c9   2 days ago           65.6MB
pedalclecle/ubuntu                  0.2.0               e768e2e4c4a9   About a minute ago   97.8MB
```

### 新旧のイメージで動作の違いを確認する。
```
$ date
Sun Mar 20 22:38:04 JST 2022

$ docker run pedalclecle/ubuntu:0.1.0 /bin/date
Sun Mar 20 13:38:11 UTC 2022

$ docker run pedalclecle/ubuntu:0.2.0 /bin/date
Sun Mar 20 22:38:16 JST 2022
```
