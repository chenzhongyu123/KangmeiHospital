
--create database CYESW
--drop database CYESW
--go
--use CYESW



go
if exists(select * from sysobjects where name='UserInfo')
drop table UserInfo;
go
--�û���
create table UserInfo(
  UserId int primary key identity(1,1),
  UserName nvarchar(10) not null,--�û�����
  UserEmile nvarchar(100) not null ,--�û�����
  UserPwd nvarchar(100) not null ,--�û�����
  Age int , --����
  moneys money,--�û����
  Info nvarchar(100),--���˼��
  Images nvarchar(100),--ͷ��
  IsDelete int ,--�Ƿ�ɾ��
  AddTime datetime,--ע��ʱ��
  IsManage int default(0),--�Ƿ�Ϊ����Ա��1Ϊ��
)
--select * from userinfo
--insert into UserInfo values('222','222','222',2,20.2,'2222','222',1,GETDATE())


go
if exists(select * from sysobjects where name='Addres')
drop table Addres;
go
--��ַ��
create table Addres(
  AddresId int primary key identity(1,1),
  Name nvarchar(20) not null ,--�ջ�������
  UserId int foreign key references UserInfo(UserId),--�û���
  Addresss1 nvarchar(100) not null ,--���µ�ַ��ʡ���У��أ�
  Addresss2 nvarchar(100) not null ,--��ϸ��ַ
  Phone nvarchar(20),--�ֻ�����
  IsDelete int ,--�Ƿ�ɾ��
)

go
if exists(select * from sysobjects where name='RealName')
drop table RealName;
go
--ʵ����֤��
create table RealName(
  RealNameId int primary key identity(1,1),
  UserId int foreign key references UserInfo(UserId),--�û���
  IdCard nvarchar(20) not null ,--���֤
  AddTime datetime,--��֤ʱ��
  IsDelete int ,--�Ƿ�ɾ��
)



go
if exists(select * from sysobjects where name='GoodsType')
drop table GoodsType;
go
--��Ʒ���ͣ��ֻ������ԣ�ͼ�飬��װ��(������)(��С��)
create table GoodsType(
  GoodsTypeId int primary key identity(1,1),
  TypeName nvarchar(20) not null ,--��������
  GoodsTypeBId int foreign key references GoodsType(GoodsTypeId),--����Լ����������������ͣ���������
)



go
if exists(select * from sysobjects where name='Goods')
drop table Goods;
go
--��Ʒ
create table Goods(
  GoodsId int primary key identity(1,1),
  UserId int foreign key references UserInfo(UserId),--�û���
  GoodsTypeId int foreign key references GoodsType(GoodsTypeId),--���ͱ�
  IsNew int,--�Ƿ�ȫ��
  Name nvarchar(100) not null ,--��Ʒ����,����
  Info nvarchar(200) not null ,--��Ʒ��Ϣ
  Price float,--�۸�
  IsPlay int ,--�Ƿ��¼�-0-��
  IsBuy int,--�Ƿ�����
  IsDelete int ,--�Ƿ�ɾ��
)


go
if exists(select * from sysobjects where name='Goodsimage')
drop table Goodsimage;
go
--��ƷͼƬ��
create table Goodsimage(
  GoodsimageId int primary key identity(1,1),
  images nvarchar(100) not null ,--ͼƬ
  GoodsId int foreign key references Goods(GoodsId),--��Ʒ��
)


go
if exists(select * from sysobjects where name='Shopping')
drop table Shopping;
go
--���ﳵ
create table Shopping(
  ShoppingId int primary key identity(1,1),
  UserId int foreign key references UserInfo(UserId),--�û���
  GoodsId int foreign key references Goods(GoodsId),--��Ʒ��
  Number int ,--����
)

go
if exists(select * from sysobjects where name='Love')
drop table Love;
go
--�ղر�
create table Love(
  LoveId int primary key identity(1,1),
  UserId int foreign key references UserInfo(UserId),--�û���
  GoodsId int foreign key references Goods(GoodsId),--��Ʒ��
  addTiem datetime,--�ղ�ʱ��
)

go
if exists(select * from sysobjects where name='Friends')
drop table Friends;
go
--���ѱ�--ͬʱ��������������λ�õ���
create table Friends(
  FriendsId int primary key identity(1,1),
  UserId1 int foreign key references UserInfo(UserId),--�û���(��)
  UserId2 int foreign key references UserInfo(UserId),--�û���(��)
  addTiem datetime,--ʱ��
)

go
if exists(select * from sysobjects where name='HuDong')
drop table HuDong;
go
--�û���������ǰ����
create table HuDong(
  HuDongId int primary key identity(1,1),
  GoodsId int foreign key references Goods(GoodsId),--��Ʒ��
  addTiem datetime,--ʱ��
)

go
if exists(select * from sysobjects where name='Texts')
drop table Texts;
go
--���ֱ��û�ÿ����һ������һ������
create table Texts(
  TextsId int primary key identity(1,1),
  UserId int foreign key references UserInfo(UserId),--�û���(��)
  Textbody nvarchar(100),--�ı�
  addTiem datetime,--ʱ��
)

go
if exists(select * from sysobjects where name='HuDong_texts')
drop table HuDong_texts;
go
--�������������
create table HuDong_texts(
  HuDong_textsId int primary key identity(1,1),
  TextsId int foreign key references Texts(TextsId),--�û���(��)
  GoodsId int foreign key references Goods(GoodsId),--��Ʒ��
  States int,--״̬��0-δ����1-�Ѷ�
)

go
if exists(select * from sysobjects where name='Pingjia_texts')
drop table Pingjia_texts;
go
--�������������
create table Pingjia_texts(
  Pingjia_textsId int primary key identity(1,1),
  TextsId int foreign key references Texts(TextsId),--�û���(��)
  GoodsId int foreign key references Goods(GoodsId),--��Ʒ��
  States int,--״̬��0-δ����1-�Ѷ�
)

go
if exists(select * from sysobjects where name='Friends_texts')
drop table Friends_texts;
go
--վ��˽�����������
create table Friends_texts(
  Friends_textsId int primary key identity(1,1),
  TextsId int foreign key references Texts(TextsId),--�û���(��)
  UserId int foreign key references UserInfo(UserId),--�û���(������Ϣ��)
  States int,--״̬��0-δ����1-�Ѷ�
)


go
if exists(select * from sysobjects where name='JuBao')
drop table JuBao;
go
--�ٱ��û�
create table JuBao(
  JuBaoId int primary key identity(1,1),
  UserId int foreign key references UserInfo(UserId),--�û���(���оٱ���)
  UserId2 int foreign key references UserInfo(UserId),--�û���(���ٱ���)
  JuBao_body nvarchar(500),--�ٱ�����
  addTiem datetime,--ʱ��
  States int,--״̬��0-���ύ��1-�Ѵ���
  HuiFu nvarchar(100),--�Ѵ����Ĵ�
)