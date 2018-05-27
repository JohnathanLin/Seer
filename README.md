# Seer


# Wuyou Platform

## 项目构建

```bash
./mvnw install
```

## 项目结构

```
wuyou_lite
|--common_lite
|--common_web_lite
|--agent_api_lite
|--customer_api_lite
|--optimizer_api_lite
|--agent_front_lite
|--customer_front_lite
|--optimizer_front_lite

common_lite: 基础依赖
common_web_lite: web配置
agent_api_lite: 发单平台后台
customer_api_lite: 客户管理后台
optimizer_api_lite: 优化师平台后台
agent_front_lite: 发单系统前台
customer_front_lite: 客户管理前台
optimizer_front_lite: 优化师前台
```

## 前台说明

- 项目结构

    ```
    project
    |--build  项目构建配置目录
    |--config  项目配置目录
    |--dist 项目打包目录
    |--src 项目开发根目录
    |----assets  静态资源
    |----common  工具类
    |----components 组件
    |----config  项目配置
    |----mixin 混合属性方法
    |----routes 路由
    |----styles 样式
    |----views 视图
    |----vuex 状态管理
    |----App.vue 根文件
    |----main.js 入口文件
    |----routes.js 路由文件
    |--static
    .gitignore
    index.html
    package.json
    README.md
    ```

- request util

    Usage:

    ```js
    // src/mixin/ajax.js
    this.$root.ajax([url], {
      post,
      pack,
      callback,
      params
    });
    ```
    
    Desc:
    
    | 参数 | 说明 | 可选值 | 默认值 |
    | --- | --- | --- | --- |
    | url | 请求API地址 | - | - |
    | post | 是否为POST请求 | true/false | false |
    | pack | 是否对象字符化 | true/false | true |
    | callback | 回调函数 | - | null |
    | params | 请求参数 | - | null |
    
- common util

    Usage:

    ```js
    // src/mixin/utility.js
    this.$root.utils.[function_name]
    ```
    
    Document:
    
    [utility](https://github.com/node-modules/utility)
    
- 注意事项

    1. 请求后台项目的基路径(base_url)配置在`src/config/index.js`。
    

## 后台说明

- 项目结构

- 注意事项
    
    1. 项目运行的端口在`src/main/resources`配置中。

## 版本控制说明

1. 在[Cooper](http://122.114.178.208/cooper)上新增需求，获取需求编号，以编号为分支。
2. 以`dev`为开发分支，`master`为上线分支，`id#`为功能开发分支。
3. 各自项目有各自的版本库，独立提交。

eg:

```
[master]$ git checkout dev
[dev]$ git checkout -b id#
[id#]$ git add/commit ...
[dev]$ git checkout dev
[dev]$ git merge --no-ff id# -m 'finished #id'
```

# 注解权限关闭 前往shiro配置类 将注解权限关闭（注释）


