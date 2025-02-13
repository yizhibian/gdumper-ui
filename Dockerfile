# 第一阶段：构建应用
FROM node:alpine AS build

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制源代码
COPY . .

# 构建项目
RUN npm run build

# 第二阶段：使用 Nginx 作为基础镜像
FROM nginx:alpine

# 删除默认的 HTML 目录
RUN rm -rf /usr/share/nginx/html

# 将第一阶段的构建产物复制到 Nginx 的 HTML 目录
COPY --from=build /app/dist /usr/share/nginx/html

# 暴露 Nginx 的默认端口
EXPOSE 80

# 启动 Nginx
CMD ["nginx", "-g", "daemon off;"]