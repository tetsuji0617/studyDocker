## 001 Hello docker

### イメージの確認（初期状態）
```
:~/001_hello_docker$ docker images
```

### docker hubからubuntuの最新イメージを取得
```
:~/001_hello_docker$ docker pull ubuntu:latest
```

### イメージの確認
```
:~/001_hello_docker$ docker images
REPOSITORY                          TAG                 IMAGE ID       CREATED       SIZE
ubuntu                              latest              e784f03641c9   2 days ago    65.6MB
```

### Dockerfileからイメージを生成
```
:~/001_hello_docker$ docker build -t pedalclecle/ubuntu:0.1.0 .
Sending build context to Docker daemon  2.048kB
Step 1/1 : FROM ubuntu:latest
 ---> e784f03641c9
Successfully built e784f03641c9
Successfully tagged pedalclecle/ubuntu:0.1.0
```

### 追加されたイメージの確認
```
:~/001_hello_docker$ docker images
REPOSITORY                          TAG                 IMAGE ID       CREATED       SIZE
ubuntu                              latest              e784f03641c9   2 days ago    65.6MB
pedalclecle/ubuntu                  0.1.0               e784f03641c9   2 days ago    65.6MB
```

### イメージからコンテナを生成
```
:~/001_hello_docker$ docker run pedalclecle/ubuntu:0.1.0 /bin/echo 'Hello world!'
Hello world!
```


