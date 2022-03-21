## Explain Dockerfile

### dockerfileの中身を更新する。
```
:~/002_dockerfile_01$ vi Dockerfile

更新内容は下記の通り
```


### dockerのイメージ作成
dockerのイメージを作成する前に現状のイメージを確認する。
```
:~/002_dockerfile_01$ docker images
REPOSITORY                          TAG                 IMAGE ID       CREATED       SIZE
ubuntu                              latest              e784f03641c9   2 days ago    65.6MB
pedalclecle/ubuntu                  0.1.0               e784f03641c9   2 days ago    65.6MB
```

dockerのイメージを作成する。
```
:~/002_dockerfile_01$ docker build -t pedalclecle/ubuntu:0.2.0 .
Sending build context to Docker daemon  2.048kB
Step 1/3 : FROM ubuntu:latest
 ---> e784f03641c9
Step 2/3 : RUN apt-get update && apt-get install -y tzdata
 ---> Running in 9f1a1037a215
Get:1 http://ports.ubuntu.com/ubuntu-ports focal InRelease [265 kB]
Get:2 http://ports.ubuntu.com/ubuntu-ports focal-updates InRelease [114 kB]
Get:3 http://ports.ubuntu.com/ubuntu-ports focal-backports InRelease [108 kB]
Get:4 http://ports.ubuntu.com/ubuntu-ports focal-security InRelease [114 kB]
Get:5 http://ports.ubuntu.com/ubuntu-ports focal/multiverse arm64 Packages [139 kB]
Get:6 http://ports.ubuntu.com/ubuntu-ports focal/main arm64 Packages [1234 kB]
Get:7 http://ports.ubuntu.com/ubuntu-ports focal/restricted arm64 Packages [1317 B]
Get:8 http://ports.ubuntu.com/ubuntu-ports focal/universe arm64 Packages [11.1 MB]
Get:9 http://ports.ubuntu.com/ubuntu-ports focal-updates/multiverse arm64 Packages [9066 B]
Get:10 http://ports.ubuntu.com/ubuntu-ports focal-updates/main arm64 Packages [1432 kB]
Get:11 http://ports.ubuntu.com/ubuntu-ports focal-updates/restricted arm64 Packages [3933 B]
Get:12 http://ports.ubuntu.com/ubuntu-ports focal-updates/universe arm64 Packages [1079 kB]
Get:13 http://ports.ubuntu.com/ubuntu-ports focal-backports/universe arm64 Packages [26.0 kB]
Get:14 http://ports.ubuntu.com/ubuntu-ports focal-backports/main arm64 Packages [51.1 kB]
Get:15 http://ports.ubuntu.com/ubuntu-ports focal-security/main arm64 Packages [1076 kB]
Get:16 http://ports.ubuntu.com/ubuntu-ports focal-security/restricted arm64 Packages [3694 B]
Get:17 http://ports.ubuntu.com/ubuntu-ports focal-security/universe arm64 Packages [796 kB]
Get:18 http://ports.ubuntu.com/ubuntu-ports focal-security/multiverse arm64 Packages [3254 B]
Fetched 17.6 MB in 7s (2563 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following NEW packages will be installed:
  tzdata
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 295 kB of archives.
After this operation, 4033 kB of additional disk space will be used.
Get:1 http://ports.ubuntu.com/ubuntu-ports focal-updates/main arm64 tzdata all 2021e-0ubuntu0.20.04 [295 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 295 kB in 2s (160 kB/s)
Selecting previously unselected package tzdata.
(Reading database ... 4120 files and directories currently installed.)
Preparing to unpack .../tzdata_2021e-0ubuntu0.20.04_all.deb ...
Unpacking tzdata (2021e-0ubuntu0.20.04) ...
Setting up tzdata (2021e-0ubuntu0.20.04) ...
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (Can't locate Term/ReadLine.pm in @INC (you may need to install the Term::ReadLine module) (@INC contains: /etc/perl /usr/local/lib/aarch64-linux-gnu/perl/5.30.0 /usr/local/share/perl/5.30.0 /usr/lib/aarch64-linux-gnu/perl5/5.30 /usr/share/perl5 /usr/lib/aarch64-linux-gnu/perl/5.30 /usr/share/perl/5.30 /usr/local/lib/site_perl /usr/lib/aarch64-linux-gnu/perl-base) at /usr/share/perl5/Debconf/FrontEnd/Readline.pm line 7.)
debconf: falling back to frontend: Teletype
Configuring tzdata
------------------

Please select the geographic area in which you live. Subsequent configuration
questions will narrow this down by presenting a list of cities, representing
the time zones in which they are located.

  1. Africa      4. Australia  7. Atlantic  10. Pacific  13. Etc
  2. America     5. Arctic     8. Europe    11. SystemV
  3. Antarctica  6. Asia       9. Indian    12. US
Geographic area:
Use of uninitialized value $_[1] in join or string at /usr/share/perl5/Debconf/DbDriver/Stack.pm line 111.

Current default time zone: '/UTC'
Local time is now:      Sun Mar 20 13:36:05 UTC 2022.
Universal Time is now:  Sun Mar 20 13:36:05 UTC 2022.
Run 'dpkg-reconfigure tzdata' if you wish to change it.

Use of uninitialized value $val in substitution (s///) at /usr/share/perl5/Debconf/Format/822.pm line 83, <GEN6> line 4.
Use of uninitialized value $val in concatenation (.) or string at /usr/share/perl5/Debconf/Format/822.pm line 84, <GEN6> line 4.
Removing intermediate container 9f1a1037a215
 ---> 4199f441ba9e
Step 3/3 : ENV TZ=Asia/Tokyo
 ---> Running in fde34c5da289
Removing intermediate container fde34c5da289
 ---> e768e2e4c4a9
Successfully built e768e2e4c4a9
Successfully tagged pedalclecle/ubuntu:latest0.2.0
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
:~/002_dockerfile_01$ date
Sun Mar 20 22:38:04 JST 2022
:~/002_dockerfile_01$ docker run pedalclecle/ubuntu:0.1.0 /bin/date
Sun Mar 20 13:38:11 UTC 2022
:~/002_dockerfile_01$ docker run pedalclecle/ubuntu:0.2.0 /bin/date
Sun Mar 20 22:38:16 JST 2022
```
