# 准备镜像
docker pull gitlab/gitlab-ee:latest

# 准备 gitlab 所需目录
mkdir gitlab
cd gitlab
mkdir config logs data

# 准备启动脚本 （替换想要的启动端口，ip 地址替换为访问你的 gitlab 的地址，也可以替换想要的挂载目录）
vi run
#! /bin/bash

sudo docker run -d --rm \
    -p 8088:8088 \
    --name gitlab \
    --env GITLAB_OMNIBUS_CONFIG="external_url 'http://118.24.64.246:8088/'; gitlab_rails['lfs_enabled'] = true;" \
    -v $PWD/config:/etc/gitlab \
    -v $PWD/logs:/var/log/gitlab \
    -v $PWD/data:/var/opt/gitlab \
    gitlab/gitlab-ee:latest
EOF

# 赋予执行权限
chmod +x run

# 启动 gitlab
./run