# web-
web课程设计之电子商务系统，ui设计和商品素材模仿自360手机商城，邮箱为本人163邮箱。作品只作为本人课程作业，如有侵权请告知删除！
学号：201930345043
姓名：张毅

# 360手机商城

## 顾客端

### 登录

- login.jsp
- UserServlet

### 注册

- register.jsp
- UserServlet

### 购买商品

- 浏览/查询

	- index.jsp
	- detail.jsp
	- GoodsServlet

- 添加至购物车

	- cart.jsp
	- CartServlet

- 付款

	- DealServlet

- 接收发货邮件

	- SendMailServlet

## 销售端

### 登录

- adminlogin.jsp
- UserServlet

### 商品管理

- 增删改查

	- controlgoods.jsp
	- updateGoods.jsp
	- GoodsServlet

### 用户信息管理

- 删改查

	- control.jsp
	- updateUser.jsp
	- UserServlet

### 查看销售情况

- controldeal.jsp
- DealServlet

## 字符统一：EncodingFilter.java

## 登录过滤：LoginFilter.jsp

## dao包
该包属于持久层，主要存放对“数据库底层”进行操作的类

## 在dao包建立一个impl包，在impl包中放置对DAO接口的实现，对DAO的接口可以实现spring的IoC操作(这就是桥接模式的应用，将接口和实现分离)。

*XMind - Trial Version*
