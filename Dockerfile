# 使用 Nginx 作为基础镜像
FROM nginx:alpine

# 替换nginx配置
# COPY nginx.conf /etc/nginx/conf.d/default.conf
# 将第一阶段的静态文件复制到nginx中
RUN rm -rf /usr/share/nginx/html
RUN mkdir /usr/share/nginx/html

# 将 dist 目录的内容复制到 Nginx 的 html 目录
COPY dist /usr/share/nginx/html

# 暴露 Nginx 的默认端口
EXPOSE 80

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]