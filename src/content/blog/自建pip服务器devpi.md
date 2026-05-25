---
title: "自建pip服务器devpi"
description: "通过自建devpi服务器，作为本地pip安装包缓存"
publishDate: 2023-04-27
tags:
  - devpi
  - pip
---

## 背景

直接用pip安装包会访问官方源，在国内速度很慢，通常用pip的清华/阿里云源替代。但即便如此，这些远程pypi源网速也不稳定，而且比如pytorch/tensorflow这种几百兆的大型包，下载仍然费时，很多时候还要重复下载。这就需要一个缓存pip服务器来做中转。

![[how_devpi_work.png]]
>对于安装命令来说，devpi服务器和其他的没有区别


## 工具和过程

-   devpi 需要 python>=3.7
-   使用版本 `devpi==2.2.0, devpi-client==5.2.3, devpi-server==6.4.0`

首先通过pip安装devpi，会附带安装devpi-server, devpi-web等依赖
```pip install devpi```

然后需要初始化devpi的配置和缓存安装包的文件夹。不指定目录默认为 `~/.devpi/server`
`devpi-init --serverdir=[PATH]`

接下来启动devpi服务器，指定ip和端口，使用之前填的文件夹路径。该版本devpi server是在前台运行的
`devpi-server --host=[HOST] --port=[PORT] --serverdir=[PATH]`

devpi 有用户机制，默认用户为 root 密码为空。每个用户可以创建多个 index，index 直接还可以继承，默认为 root/pypi。可以使用 `devpi index [USER/INDEX]` 来查看 index 的配置详情。

第一次启动后，会自动从python官方源下载索引。这时需要修改root/pypi这个index中的配置，切换镜像源地址以阿里云为例。首先需要选择index地址，然后用户登陆，默认密码为空，最后指定镜像的地址。（对于国外用户，这一步就省了，可以直接使用）

``` sh
devpi use http://[HOST]:[PORT]/root/pypi
devpi login root password=''

devpi index root/pypi \
"mirror_web_url_fmt=https://mirrors.aliyun.com/pypi/simple/{name}/" \
"mirror_url=https://mirrors.aliyun.com/pypi/simple/"
```

替换之后devpi server会停止下载的原索引，转为从新的源下载。同步完成后，会删除旧索引，索引都在indices文件夹中，占有空间在400M左右。在server的日志中，可以看到下载队列的提示，也可以在网页上看到更新状态，地址为 `http://[HOST]:[PORT]/root/pypi`

## 使用方法

### pip config 配置
和使用阿里云/清华源一样，临时使用在 pip install 后添加 index_url 和 trusted_host，长期使用修改本地pip.conf文件，默认在 `~/.pip/pip.conf`

```
[global]
trusted-host=[HOST]
index-url=http://[HOST]:[PORT]/root/pypi/
# extra-index-url=http://mirrors.aliyun.com/pypi/simple/
timeout=120
```

### 持久服务

可以用supervisor/nginx等管理和端口转发的工具，官方提供了自动生成配置文件的指令devpi-gen-config

[Quickstart: permanent install on server/laptop — devpi server-6.0, client-5.2, web-4.0 documentation](https://devpi.net/docs/devpi/devpi/stable/+doc/quickstart-server.html#generating-example-config-files-for-supervisor-nginx-cron-launchd)
也可以通过docker来部署成一个持久服务，dockerhub上下载最多的是几年前的旧版本，功能没有当前版本全。可以基于python镜像。手动打包一个不复杂，只需要准备一个大容量的文件夹，初始化后挂载到容器中，运行devpi-server就好了。

## 其他

### devpi的组成
虽然包名叫devpi，但在这个版本，功能已经被分为客户端 devpi-client 和服务端 devpi-server：
-   直接使用devpi的命令调用的是devpi-client，专门管理已经启动的服务（index，user等指令）
-   而devpi-server加参数用来启动服务器。只有先启动devpi服务，client才能控制（use指令）

不足的是，我目前还没有找到一步到位配置devpi的方法。首次启动服务器时，mirror_url不能通过config文件传递给程序，只能用上文方式登陆后再修改。但还好，只需要配置一次。这些配置文件会存放在server目录中的数据库文件。

另外一个组件是devpi-web，一个网页版客户端，和cli版本的功能互相补全（或者说两个客户端功能都残废）。网页地址和 index_url 相同。网页上可以搜索包名，点击对应版本的安装包可以直接下载。如果已经缓存过，描述中会显示文件大小，反之说明没有本地缓存。

![[devpi_webpage.png]]
>已缓存的显示Size，点击链接也可以开始下载

另外，使用时可能会报错serial mismatch，导致devpi不用阿里云而是官方源下载。这是因为该包的本地index过时，使用 `devpi refresh [PKG]` 来刷新本地缓存，或者在网页中对应包的 simple index 界面，点击 refresh 按钮。

### 上传私有包
devpi 的 index 有两种类型，mirror 和 stage. 前者就是默认使用的，拉取远程镜像，但不能传文件到这个 index中。这时需要创建新的 index，指定 stage 类型。然后 devpi use 这个 index，再 devpi upload 本地包。（更多的操作例如本地发布包，也有对应的指令，这个我没有深究）当我下载时，devpi 会先搜索上传的包，如果没有找到依然能通过 mirror 的 index 来下载，则可以修改 bases，指向 root/pypi，这样就串联起来了。

### 同类比较
-   pypi-server 是官方推荐的一个服务器，但主要用做上传私有包。上传方便，直接拷贝安装包到文件夹即可。但目前没查到缓存已下载包的方法，使用时和其他源是并列关系。
-   bendersnatch 功能也很强大，但会把源镜像的包全部同步到本地，需要大量存储空间。
-   devpi 下载次数越多，缓存命中率越高，安装速度越快。
-   更多同类比较参考
[利用Docker快速构建基于devpi的企业级私有PyPI Server - 掘金 (juejin.cn)](https://juejin.cn/post/6994380597535703053)

具体指令可以在--help或者官网上查看文档，可以解决90%的问题。help 中的描述很全，但需要配合文档才知道具体填什么。官网文档写的很有操作性，但多少漏了细节，最后需要配合github的代码看。总的来说挺好，只用作缓存服务器绰绰有余了。

## 参考
-   [http://doc.devpi.net/](http://doc.devpi.net/)
-   [devpi/devpi: Python PyPi staging server and packaging, testing, release tool (github.com)](https://github.com/devpi/devpi)
-   [devpi搭建pip源服务器 - 博客 - 编程圈 (bianchengquan.com)](https://www.bianchengquan.com/article/602635.html)
-   [使用私有的PyPI仓库源突破网络限制 – 北凉柿子 (beiliangshizi.com)](http://www.beiliangshizi.com/?p=556) [使用devpi来搭建缓存镜像源服务器 (daimajiaoliu.com)](https://daimajiaoliu.com/daima/4eee7659a900404)