# 用途

用于在单机快速部署git仓库，cicd平台

包含：

- 容器管理  https://www.portainer.io/
- 代码仓库  https://gitea.com/
- 持续集成 https://www.drone.io/

# 环境要求

Unix-like system, 如 ubuntu server

需要安装

- git 
- docker
- docker-compose

在ubuntu环境下，安装脚本如下

```
sudo apt install docker
sudo apt install docker-compose
sudo gpasswd -a $USER docker
```

安装后，重新login刷新权限

# Install

## 下载

```
cd $HOME
mkdir work
cd work
git clone git@github.com:liyesa/devastro.git
```

## 配置

- HOST_0 改为本机IP
- GIT_CLIENT_ID  GIT_CLIENT_SECRET 需要gitea启动后，在setting页面添加oauth授权并生成

```
vi ~/work/devastro/deploy/miniastro/.env

#修改为本机IP
HOST_0=10.10.11.220
HOST=${HOST_0}
VOLUMES=${HOME}/data/volumes
DB_URL=${HOST}:3306
DB_USER_NAME=root
DB_USER_PASSWORD=root
ZK_PORT=2181
GIT_DOMAIN=git.me
#gitea启动并配置后再修改
GIT_CLIENT_ID=xxx
#gitea启动并配置后再修改
GIT_CLIENT_SECRET=xxx
GIT_PORT_HTTP=3000
DRONE_DOMAIN=drone.me
DRONE_PORT_HTTP=3100
DRONE_RUNNER_DOCKER_PORT=3200
PORTAINER_PORT_HTTP=3300

```

- 修改/etc/host，添加以下三个域名绑定，IP和上的HOST_0相同

```
10.10.11.220 git.me drone.me dev.me
```

## 启动

```
cd ~/work/devastro/deploy/miniastro
./up.sh
```



## 配置持续集成

- 访问 http://git.me:3000/ ， 注册账号
- 配置oauth  http://git.me:3000/user/settings/applications
  - Application Name: drone
  - Redirect URI: http://drone.me:3100/login
  - Create Application
- 将生成的 Client ID 和 Client Secret ，填写到上面的.env文件中
- 执行up.sh 重启容器

#  Usage

## 容器管理

- http://dev.me:3300

## Git仓库

- http://git.me:3000/

## 持续集成

- http://drone.me:3100/



# Sample

## 执行持续集成

xxx
