
--create database CYESW
--drop database CYESW
--go
--use CYESW



go
if exists(select * from sysobjects where name='UserInfo')
drop table UserInfo;
go
--用户表
create table UserInfo(
  UserId int primary key identity(1,1),
  UserName nvarchar(10) not null,--用户名称
  UserEmile nvarchar(100) not null ,--用户邮箱
  UserPwd nvarchar(100) not null ,--用户密码
  Age int , --年龄
  moneys money,--用户存款
  Info nvarchar(100),--个人简介
  Images nvarchar(100),--头像
  IsDelete int ,--是否删除
  AddTime datetime,--注册时间
  IsManage int default(0),--是否为管理员，1为是
)
--select * from userinfo
--insert into UserInfo values('222','222','222',2,20.2,'2222','222',1,GETDATE())


go
if exists(select * from sysobjects where name='Addres')
drop table Addres;
go
--地址表
create table Addres(
  AddresId int primary key identity(1,1),
  Name nvarchar(20) not null ,--收获人姓名
  UserId int foreign key references UserInfo(UserId),--用户表
  Addresss1 nvarchar(100) not null ,--大致地址（省，市，县）
  Addresss2 nvarchar(100) not null ,--详细地址
  Phone nvarchar(20),--手机号码
  IsDelete int ,--是否删除
)

go
if exists(select * from sysobjects where name='RealName')
drop table RealName;
go
--实名认证表
create table RealName(
  RealNameId int primary key identity(1,1),
  UserId int foreign key references UserInfo(UserId),--用户表
  IdCard nvarchar(20) not null ,--身份证
  AddTime datetime,--认证时间
  IsDelete int ,--是否删除
)



go
if exists(select * from sysobjects where name='GoodsType')
drop table GoodsType;
go
--商品类型（手机，电脑，图书，服装）(分三级)(最小级)
create table GoodsType(
  GoodsTypeId int primary key identity(1,1),
  TypeName nvarchar(20) not null ,--类型名称
  GoodsTypeBId int foreign key references GoodsType(GoodsTypeId),--外键自己的主键，二级类型，三级类型
)



go
if exists(select * from sysobjects where name='Goods')
drop table Goods;
go
--商品
create table Goods(
  GoodsId int primary key identity(1,1),
  UserId int foreign key references UserInfo(UserId),--用户表
  GoodsTypeId int foreign key references GoodsType(GoodsTypeId),--类型表
  IsNew int,--是否全新
  Name nvarchar(100) not null ,--商品名称,标题
  Info nvarchar(200) not null ,--商品信息
  Price float,--价格
  IsPlay int ,--是否下架-0-否
  IsBuy int,--是否卖出
  IsDelete int ,--是否删除
)


go
if exists(select * from sysobjects where name='Goodsimage')
drop table Goodsimage;
go
--商品图片表
create table Goodsimage(
  GoodsimageId int primary key identity(1,1),
  images nvarchar(100) not null ,--图片
  GoodsId int foreign key references Goods(GoodsId),--商品表
)


go
if exists(select * from sysobjects where name='Shopping')
drop table Shopping;
go
--购物车
create table Shopping(
  ShoppingId int primary key identity(1,1),
  UserId int foreign key references UserInfo(UserId),--用户表
  GoodsId int foreign key references Goods(GoodsId),--商品表
  Number int ,--数量
)

go
if exists(select * from sysobjects where name='Love')
drop table Love;
go
--收藏表
create table Love(
  LoveId int primary key identity(1,1),
  UserId int foreign key references UserInfo(UserId),--用户表
  GoodsId int foreign key references Goods(GoodsId),--商品表
  addTiem datetime,--收藏时间
)

go
if exists(select * from sysobjects where name='Friends')
drop table Friends;
go
--好友表--同时生成两个表，主次位置调换
create table Friends(
  FriendsId int primary key identity(1,1),
  UserId1 int foreign key references UserInfo(UserId),--用户表(主)
  UserId2 int foreign key references UserInfo(UserId),--用户表(次)
  addTiem datetime,--时间
)

go
if exists(select * from sysobjects where name='HuDong')
drop table HuDong;
go
--用户互动表，买前互动
create table HuDong(
  HuDongId int primary key identity(1,1),
  GoodsId int foreign key references Goods(GoodsId),--商品表
  addTiem datetime,--时间
)

go
if exists(select * from sysobjects where name='Texts')
drop table Texts;
go
--文字表，用户每发布一次生成一行数据
create table Texts(
  TextsId int primary key identity(1,1),
  UserId int foreign key references UserInfo(UserId),--用户表(主)
  Textbody nvarchar(100),--文本
  addTiem datetime,--时间
)

go
if exists(select * from sysobjects where name='HuDong_texts')
drop table HuDong_texts;
go
--互动文字外键表
create table HuDong_texts(
  HuDong_textsId int primary key identity(1,1),
  TextsId int foreign key references Texts(TextsId),--用户表(主)
  GoodsId int foreign key references Goods(GoodsId),--商品表
  States int,--状态，0-未读，1-已读
)

go
if exists(select * from sysobjects where name='Pingjia_texts')
drop table Pingjia_texts;
go
--评价文字外键表
create table Pingjia_texts(
  Pingjia_textsId int primary key identity(1,1),
  TextsId int foreign key references Texts(TextsId),--用户表(主)
  GoodsId int foreign key references Goods(GoodsId),--商品表
  States int,--状态，0-未读，1-已读
)

go
if exists(select * from sysobjects where name='Friends_texts')
drop table Friends_texts;
go
--站内私聊文字外键表
create table Friends_texts(
  Friends_textsId int primary key identity(1,1),
  TextsId int foreign key references Texts(TextsId),--用户表(主)
  UserId int foreign key references UserInfo(UserId),--用户表(接受信息者)
  States int,--状态，0-未读，1-已读
)


go
if exists(select * from sysobjects where name='JuBao')
drop table JuBao;
go
--举报用户
create table JuBao(
  JuBaoId int primary key identity(1,1),
  UserId int foreign key references UserInfo(UserId),--用户表(进行举报者)
  UserId2 int foreign key references UserInfo(UserId),--用户表(被举报者)
  JuBao_body nvarchar(500),--举报内容
  addTiem datetime,--时间
  States int,--状态，0-已提交，1-已处理
  HuiFu nvarchar(100),--已处理后的答复
)