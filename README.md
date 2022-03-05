# studyDocker

## docker fileの作成

```
$ vi Dockerfile
```

## イメージの作成

```
$ docker build -t [tagname]:[version] [dockerfile Dir]

ex)
$ docker build -t studyDocker:0.0.1 .
```

作成したイメージの確認→削除

```
# イメージの作成
$ docker images

# イメージの削除
$ docker rmi [IMAGE ID]
```

## コンテナの削除

```
$ docker run -it [REEPOSITORY NAME]
```

## コンテナの起動・終了、アタッチ・デタッチ

```
# コンテナの起動
$ docker start [CONTAINER ID or CONTAINER NAME]

# コンテナの終了
$ docker stop [CONTAINER ID or CONTAINER NAME]
```

コンテナの終了でexitするとコンテナが停止するので、再起動後、アタッチデタッチする。
```
# コンテナの起動
$ docker start [CONTAINER ID or CONTAINER NAME]

# コンテナにアタッチ
$ docker attach [CONTAINER ID or CONTAINER NAME]

# コンテナからのデタッチ
Ctrl+P　Ctrl+Q

# コンテナにアタッチした状態でコンテナの終了
$ root@[CONTAINER ID]:/# exit
```
