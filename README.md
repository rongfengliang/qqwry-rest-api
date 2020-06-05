
# openresty + 纯真ip库模仿搜狐获取客户ip区域

暂不支持ipv6，纯真ip库为5-30的更新日期

## 几个参考项目

https://github.com/WisdomFusion/qqwry.dat

https://github.com/freshcn/qqwry

https://github.com/chetansurwade/geoip2-rest-api-golang

## 原理

本来打算使用geoip2 基于nginx（后边发现构建很费事（预编译包），同时维护费事）
所以基于nginx（openresty）+rest api(golang) 模式集成

## 构建

* golang 

go build (基于go mod)

* docker

docker-compose build app


## rest api 测试

->  http://localhost:8080/geoip?ip=113.193.190.207

->  http://localhost:8080/geoip?ip=113.193.190.207&ip=114.114.114.114


## 搜狐格式

* 搜狐请求信息

https://pv.sohu.com/cityjson

格式

```code
var returnCitySN = {"cip": "xxxxx", "cid": "xxxxx", "cname": "xxxxx"};
```

* openresty 集成rest api 访问

http://<ip>:<port>/cityjson


```code
var returnCitySN = {"cip": "xxxxxxxx", "cid": "xxxxxx", "cname": "xxxxx"};

```

* 一些说明

目前cid 是一个默认值,暂时没有处理