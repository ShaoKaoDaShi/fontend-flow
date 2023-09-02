# 使用基础镜像
FROM nginx

# 安装 SSH 服务
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# 设置 SSH 密码
RUN echo 'root:password' | chpasswd

# 允许 root 用户通过 SSH 登录
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# 暴露 SSH 和 Nginx 端口
EXPOSE 22 80

# 启动 SSH 和 Nginx 服务
CMD service ssh start && nginx -g 'daemon off;'